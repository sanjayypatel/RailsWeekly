class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.references :user, index: true, foreign_key: true
      t.string :personal_url

      t.timestamps null: false
    end
  end
end
