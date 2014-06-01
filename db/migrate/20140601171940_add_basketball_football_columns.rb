class AddBasketballFootballColumns < ActiveRecord::Migration
  def change
    add_column :users, :basketball, :string
    add_column :users, :football, :string
    add_column :users, :have_team, :boolean
  end
end
