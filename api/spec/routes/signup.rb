
require "httparty"
class Signup
   
    include HTTParty
    def create(payload)   
    return self.class.post("http://rocklov-api:3333/signup",
            body:payload.to_json,
            headers:{
                "Content-Type":"application/json",
            },
        )
      end
    end