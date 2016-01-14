class PortfolioController < ApplicationController
  def show
    @portfolio = Portfolio.find(params[:id])
    authorize @portfolio
    @user = @portfolio.user
    @repositories = @portfolio.repositories
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
    authorize @portfolio
    @user = @portfolio.user
    @repositories = @portfolio.repositories
    client = Octokit::Client.new(:access_token => session[:access_token])
    @found_repositories = client.list_repositories(client.user)
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    authorize @portfolio
    @portfolio.update_attributes(portfolio_params)
    redirect_to user_portfolio_path(@portfolio.user, @portfolio)
  end

  private 

  def portfolio_params
    params.require(:portfolio).permit(:personal_url)
  end

end