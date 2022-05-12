class Api::V1::SessionsController < ApplicationController
    include RackSessionFix

    def login
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            render json: {success: true, message: "User logged in successfully", user: @user}, status: :created
        else
            render json: {success: false, message: "Invalid email or password"}, status: :unprocessable_entity
        end
    end

    def logout
        session[:user_id] = nil
        render json: {success: true, message: "User logged out successfully"}, status: :ok
    end
end