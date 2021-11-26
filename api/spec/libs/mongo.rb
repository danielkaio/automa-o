require "mongo"

class MongoDB
    attr_accessor :users , :equipos

   
        def initialize
            client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
            @users = client[:users]
            @users =client[:equipos]
        end


            def remove_user(email)
                @users.delete_many({email:"email"})
            end

            def get_user(email)
                @users.find({"email":email}).first
        
            end

            def remove_equipo(email, name)
              @user_id = get_user(email)
              @equipos.delete_many({name:'name', user:'user_id'})
            end

            def get_mongo_id 
                return BSON::ObjectId.new
          end
        end