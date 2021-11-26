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
                thumbnail:   Helpers::get_thumb("kramer.jpg"),
                name:"kramer", 
                category: "audio" , 
                price:200,
            }

            equipo =  Equipos.new.create(@payload,@user_id)
            @equipos_id = equipo.parsed_response["_id"]
           @result = Equipos.new.remove_by_id(@equipos_id,@user_id)

        end

        it "deve retornar 204" do
            expect(@result.code) == 204
        end

       
     
    end

    context "equipo não existe"do
        before(:all) do
          @result =  Equipos.new.remove_by_id(MongoDB.new.get_mongo_id,@user_id)
        end
        it "deve retornar 204"do
        expect(@result.code) == 204
        end
    end
end