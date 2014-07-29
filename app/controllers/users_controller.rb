class UsersController < ApplicationController

  before_filter :authorize

  def new
    @user=User.new
  end

  def create
    return redirect_to new_user_url unless params[:user]

    @user = User.new(user_params)
    if @user.save
      p "--------------"
      p @user
      redirect_to synonym_index_url, notice: "Thank you for signing up!"
    else
      p "-----RENDER---------"
      p @user
      redirect_to new_user_url
    end
  end

  def user_params
    params[:user].permit(:email, :name, :password, :password_confirmation)
  end
end
