class Types::TaskType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false

    def foo
        "Foo #{self.username}!"
    end
end