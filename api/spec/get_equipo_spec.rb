require_relative "routes/sessions"
require_relative "helpers"
require_relative "routes/equipos"
require_relative "libs/mongo"


describe "GET/equipos {equipos_id}" do

    before(:all) do

    @payload = { email:"to@mate@yahoo.com",password:"12345@"}
    result =  Sessions.new.login(@payload)
    @user_id = result.parsed_response['_id']      
end
    
    context "unico equipo" do
        
        before(:all) do
            
            @payload = { 
                thumbnail:   Helpers::get_thumb("violino.jpg"),
                name:"violino", 
                category: "outros" , 
                price:900,
            }

            equipo =  Equipos.new.create(@payload,@user_id)
            @equipos_id = equipo.parsed_response["_id"]
           @result = Equipos.new.find_by_id(@equipos_id,@user_id)

        end

        it "deve retornar 200" do
            expect(@result.code) == 200
        end

        it "deve retornar nome do campo" do
            
        end
     
    end

    context "equipo não existe"do
        before(:all) do
          @result =  Equipos.new.find_by_id(MongoDB.new.get_mongo_id,@user_id)
        end
        it "deve retornar 404"do
        expect(@result.code) == 404

            
        end
    end
end


describe "GET/equipos" do
    
    before(:all) do

        @payload = { email:"to@mate@yahoo.com",password:"12345@"}
        result =  Sessions.new.login(payload)
        @user_id = result.parsed_response['_id']
        
             
        context "obter uma lista" do
            
            before(:all) do
            payloads = [
                {

                thumbnail:   Helpers::get_thumb("violino.jpg"),
                name:"tambor", 
                category: "outros" , 
                price:900,

                },

                {

                thumbnail:   Helpers::get_thumb("teclado.jpg"),
                name:"teclado", 
                category: "outros" , 
                price:900,

                },

                {

                thumbnail:   Helpers::get_thumb("trompete.jpg"),
                name:"trompete", 
                category: "outros" , 
                price:900,

                },

                {

                    thumbnail:   Helpers::get_thumb("violino.jpg"),
                    name:"violino", 
                    category: "outros" , 
                    price:900,
    
                    }
            ]

            
            payloads.each do |payload|
                MongoDB.new.remove_equipo(payload[:name], user_id)
                Equipos.new.create(payload,@user_id)

             
            end
        
            @result  = Equipos.new.list(@user_id)
            end


            it "deve retornar 200" do
                expect(@result.code) == 200
            ends

           

            it "deve retornar uma lista de equipos" do
                 expect(@result.parsed_response).not_to be_empyty
                
                    
                end
              
            end
            
        end
    end
end 
    
    


