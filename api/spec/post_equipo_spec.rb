require_relative "routes/equipos"
require_relative "routes/sessions"
require_relative "libs/mongo"
require_relative "helpers"


describe "POST /equipos" do

    payload = { email:"to@mate@yahoo.com",password:"12345@"}
    result =  Sessions.new.login(payload)
    
    context "novo equipo" do
        
        before(:all) do
         

            payload = { 
                thumbnail:   Helpers::get_thumb("kramer.jpg"),
                name:"kramer", 
                category: "corda" , 
                price:299,
            }

          

           @result =  Equipos.new.create(payload,@user_id)
           
        end

        it "deve retornar 200" do
            expect(@result.cod) == 200
        end


        context "sem autorização" do
        
            before(:all) do
            
                payload = { 
                    thumbnail: Helpers::get_thumb("kramer.jpg"), 
                    name:"baixo", 
                    category: "corda" , 
                    price:59,
                }
    
    
              
    
               @result =  Equipos.new.create(payload,nil)
               
            end
    
            it "deve retornar 401" do
                expect(@result.code) == 401
            end
        end
    end


end

