class AddBaseballColumn < ActiveRecord::Migration
  def change
    add_column :users, :baseball, :string
  end
end
