class SessionsController < ApplicationController
  def create
    user_params
    user = User.where(:email => params[:email]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:users]=User.find(session[:user_id])
      redirect_to synonym_index_url
    else
      flash.now.alert = "Email or password is invalid"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    render :new
  end

  def user_params
    params.permit(:email, :user_id, :password)
  end
end