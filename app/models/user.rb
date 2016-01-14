class User < ActiveRecord::Base
  has_one :portfolio
  has_many :repositories, through: :portfolio

  def self.create_with_omniauth(auth)
    user = User.new(
      provider: auth["provider"],
      uid: auth["uid"],
      name: auth["info"]["name"]
    )
    user.save
    portfolio = Portfolio.new(user: user)
    portfolio.save
    return user
  end

end
