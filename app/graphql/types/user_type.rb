class Types::UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :email, String, null: false
    field :foo, String

    def foo
        pp self
        "Foo!"
    end
end