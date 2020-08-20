class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path( @user.id)

            # redirect_to root_path, notice: "Account Created!"
        else
            render :new
        end
    end

    def show

    end

    private
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
    end
end
