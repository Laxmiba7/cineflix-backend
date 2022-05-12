class Api::V1::UsersController < ApplicationController
   include RackSessionFix

   

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            render json: {success: true, message: "User created successfully"}, status: :created
        else
            render json: {success: false, message: @user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update 
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: {success: true, message: "User updated successfully", user: @user}, status: :ok
        else
            render json: {success: false, message: @user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.permit(:name, :email, :password, :password_confirmation)
    end
end
