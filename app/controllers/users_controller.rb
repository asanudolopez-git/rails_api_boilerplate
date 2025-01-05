class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        render json: @user, serializer: UserSerializer
    end

    def index
        @users = User.all
        render json: @users, each_serializer: UserSerializer
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, serializer: UserSerializer
        else
            render json: { errors: @user.errors }, status: 422
        end
    end

    def update
    end

    def destroy
    end

    private

    def user_params
        params.expect(
            user: [:username, :email, :password]
        )
    end
end
