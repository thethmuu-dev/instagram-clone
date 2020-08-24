class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    before_action :require_user, except: [:new, :create]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to root_path, notice: "Account Created!"
        else
            render :new
        end
    end

    def show

    end

    def edit

    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Profile Data Updated!"
            redirect_to @user
          else
            render 'edit'
          end
    end

    private
    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :username, :password, :password_confirmation, :profile)
    end

    def require_same_user
        if current_user != @user
          flash[:alert] = "You can only edit your own account"
          redirect_to @user
        end
    end
end
