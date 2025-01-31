module Mutations
  class CreateUser < BaseMutation
    null true
    argument :body, String
    # argument :post_id, ID

    field :user, Types::UserType
    field :errors, [String], null: false

    def resolve(body:)
      user = User.build(body: body)
      if user.save
        # Successful creation, return the created object with no errors
        {
          user: user,
          errors: [],
        }
      else
        # Failed save, return the errors to the client
        {
          user: nil,
          errors: comment.errors.full_messages
        }
      end
    end
  end
end