class UsersController < ApplicationController
    wrap_parameters format: []

    def create
        user = User.create!(user_params)
        if user.valid?
            session[:user_id] = user.id
            session[:password] = user.password
            render json: user, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(session[:user_id])
        if user.valid?
            render json: user
        else
            render json: {error: user.errors.full_messages}, status: :unauthorized
        end
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end
end
