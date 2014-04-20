class ErrorsController < ApplicationController
  def routing
    render :text => "Invalid Resource"
  end
end