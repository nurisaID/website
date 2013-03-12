class UsersController < ApplicationController
  def new
	@user = User.new
  end
  def create
	@user = User.new(params[:user])
		if @user.save
		flash[:notice] = "You signed now!"
		redirect_to :template => 'index.html.erb'
		else
		flash[:notice] = "data invalid"
		render "new"
		end
  end
end
