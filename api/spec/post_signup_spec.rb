
require_relative "libs/mongo"
require_relative "routes/signup"




describe "POST /signup" do
    context "novo usuario" do
  

  before(:all) do
      
  payload = {email:"joana.ajala@yahoo.com",password:"123@"}
  MongoDB.new.remove_user(payload[:email])
  
   @result = Signup.new.create(payload)

        
  end


  it "valida status code   " do
       
    expect(@result.code) == 200

   end
   

      
it "valida id do usuario" do
       
  expect(@result.parsed_response["_id"]) ==  24
end
  end
  end
   
