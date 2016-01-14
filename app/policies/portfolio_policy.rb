class PortfolioPolicy < ApplicationPolicy

  def show?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

end