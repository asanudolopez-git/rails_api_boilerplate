class UsersController < ApplicationController

    def show
        render json: User.find(params[:id]), serializer: UserSerializer
    end

    def index
        render json: User.all, each_serializer: UserSerializer
    end
    
    def create
    end

    def update
    end

    def destroy
    end
end
