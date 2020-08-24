class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to image_posts_path, alert: "Already Logged In!"
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to image_posts_path, notice: "Logged In!"
    else
      flash.now[:alert] = 'Login Failed!'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged Out!"
  end
end
