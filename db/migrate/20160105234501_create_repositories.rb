class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.references :portfolio, index: true, foreign_key: true
      t.string :repo_url

      t.timestamps null: false
    end
  end
end
