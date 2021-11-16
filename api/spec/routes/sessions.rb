
require "httparty"
class Sessions
   
    include HTTParty
    def login(payload)   
    return self.class.post("http://rocklov-api:3333/sessions",
            body:payload.to_json,
            headers:{
                "Content-Type":"application/json",
            },
        )
      end
    end