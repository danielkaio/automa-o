require_relative "routes/sessions"
require_relative "helpers"
require_relative "routes/equipos"

describe "GET/equipos {equipos_id}" do

    before(:all) do

    payload = { email:"to@mate@yahoo.com",password:"12345@"}
    result =  Sessions.new.login(payload)
    @user_id = result.parsed_response['_id']
    
         

       

    end
    
    context "unico equipo" do
        
        before(:all) do
            
            payload = { 
                thumbnail:   Helpers::get_thumb("violino.jpg"),
                name:"violino", 
                category: "outros" , 
                price:900,
            }

            equipo =  Equipos.new.create(payload,@user_id)
            @equipos_id = equipo.parsed_response["_id"]
           @result = Equipos.new.find_by_id(@equipos_id,@user_id)

        end

        it "deve retornar 200" do
            expect(@result.code) == 200
        end
     
    end
end