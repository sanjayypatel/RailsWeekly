class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # client = Octokit::Client.new(:access_token => session[:access_token])
    # @repositories = client.list_repositories(client.user)
  end
end
