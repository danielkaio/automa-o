require "httparty"

context "login com sucesso" do
describe "POST /sessions" do
  

  before(:all) do
      
   
        
        payload = {email:"dani.ajala@yahoo.com",password:"12345@"}
    
     @result =   HTTParty.post("http://rocklov-api:3333/sessions",
            body:payload.to_json,
            headers:{
                "Content-Type":"application/json",
            },
        )
        puts "teste"
  end
   
it "valida status code" do
       
    expect(@result.code).to eql 200

   end

it "valida id do usuario"  do
    expect(@result.parsed_response["_id"].length).to eql 24

   end

    end
end