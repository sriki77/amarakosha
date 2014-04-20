class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def render_with (code, msg)
    render :text => msg, :status => code
  end

  def render_msg (msg)
    render :text => msg
  end

  def current_user
    @current_user=session[:user] if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to login_url if current_user.nil?
  end

  def to_j (o)
    o.as_json(:except => [:id, :created_at, :updated_at, :lock_version])
  end

  def load_ref_data
    p @allSynonyms
    @allSynonyms ||=Synonym.all
  end
end
