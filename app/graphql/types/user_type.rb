module Types
    class UserType < BaseObject
        field :id, ID, null: false
        field :username, String, null: false
        field :email, String, null: false
        field :foo, String
        field :tasks, [Types::TaskType]

        def foo
            "Foo #{self.object.username}!"
        end
    end
end