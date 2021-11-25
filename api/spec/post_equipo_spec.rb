require_relative "routes/equipos"
require_relative "routes/sessions"
require_relative "libs/mongo"

describe "POST /equipos" do

    payload = { email:"to@mate@yahoo.com",password:"12345@"}
    result =  Sessions.new.login(payload)
    
    context "novo equipo" do
        
        before(:all) do
            thumbnail = File.open(File.join(Dir.pwd,"spec/fixtures/image","kramer.jpg"),"rb")


            payload = { 
                thumbnail:thumbnail, 
                name:"kramer", 
                category: "corda" , 
                price:299,
            }

          

           @result =  Equipos.new.create(payload,@user_id)
           
        end

        it "deve retornar 200" do
            expect(@result.code) == 200
        end


        context "sem autorização" do
        
            before(:all) do
                thumbnail = File.open(File.join(Dir.pwd,"spec/fixtures/image","violino.jpg"),"rb")
    
    
                payload = { 
                    thumbnail:thumbnail, 
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

