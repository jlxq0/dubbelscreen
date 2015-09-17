class UsersController < ApplicationController
  def show
    @user = User.find_by name: params['name']
    #@user = params
  end
end
