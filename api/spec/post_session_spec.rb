

require_relative "routes/sessions"

context "login com sucesso" do
describe "POST /sessions" do
  

  before(:all) do
      
   
  @result = Sessions.new.login("dani.ajala@yahoo.com","12345")
        
  end
   
it "valida status code" do
       
    expect(@result.code).to eql 401

   end

it "valida id do usuario"  do
    expect(@result.parsed_response["error"]).to eql  "Unauthorized"
end
end
end
 


context "senha invalida" do
  describe "POST /sessions" do
    
  
    before(:all) do
        
     
    @result = Sessions.new.login("dani.ajala@yahoo.com","1345")
          
    end
     
  it "valida id do usuario" do
         
      expect(@result.parsed_response["error"]).to eql "Unauthorized"
  
     end
  
  it "valida id do usuario"  do
      expect(@result.parsed_response["error"]).to eql  "Unauthorized"
  end
  end
  end
   
  