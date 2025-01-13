module Resolvers
    class UserResolver < BaseResolver
        # type [Types::UserType], null:false
        type [Types::UserType], null:false
        # argument :id, ID

        # def resolve(id:)
        def resolve
            User.all
            # ::User.find(id)
        end
    end
end