class RepositoriesController < ApplicationController

  def create
    @repository = Repository.new(repository_params)
    @repository.save
    redirect_to edit_user_portfolio_path(@repository.portfolio.user, @repository.portfolio)
  end

  private

  def repository_params
    params.require(:repository).permit(:name, :repo_url, :portfolio_id)
  end

end
