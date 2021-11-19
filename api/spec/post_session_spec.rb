

require_relative "routes/sessions"
require_relative "helpers"

context "login com sucesso" do
describe "POST /sessions" do
  

  before(:all) do
      
  payload = { name:'daniel',email:"dani.ajala@yahoo.com",password:"12345@"}
  @result = Sessions.new.login(payload)
        
  end
   
it "valida status code   " do
       
    expect(@result.code) == 200

   end
   

      
it "valida id do usuario" do
       
  expect(@result.parsed_response["error"]) == "Unauthorized "
   end
  end

 

  end
 


#  examples = [
   
#    {
#     title:"senha incorreto",
#     payload: {email:"dani.ajala@yahoo.com",password:"1234@"},
#     code:401,
#     error:"Unauthorized",

#    },


#    {
#     title: "usuario nao existe",
#     payload: {email:"404.ajala@yahoo.com",password:"1234@"},
#     code:401,
#     error:"Unauthorized",

#   },


#   {
#     title: "email em branco",
#     payload: {email:"",password:"1234@"},
#     code:412,
#     error:"required email",

#   },


#   {
#     title:"sem o campo email",
#     payload: {password:"1234@"},
#     code:412,
#     error:"required email",

#   },


#   {
#     title:"senha em branco",
#     payload: {email:"404.ajala@yahoo.com",password:""},
#     code:412,
#     error:"required password",

#   },



#   {
#     title:"sem o campo senha",
#     payload: {email:"404.ajala@yahoo.com"},
#     code:412,
#     error:"required password",

#   },


 
examples = Helpers::get_fixture("login")

 examples.each do |e|

  context "#{e[:title]}" do
 
  
    
  
    before(:all) do
      payload = {email:"dani.ajala@yahoo.com",password:"1234@"}
     
    @result = Sessions.new.login(payload)
          
    end
     
  it "valida id do usuario" do
         
      expect(@result.parsed_response["error"]).to eql "Unauthorized"
  
     end
  
  it "valida status code"  do
      expect(@result.parsed_response["error"]).to eql  "Unauthorized"
     end
    end
  end


