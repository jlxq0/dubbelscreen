class TriggersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:index]

  def index
    GetApiDataForUserJob.perform_later(params[:user_name])
    render :layout => 'blank'
  end
end
