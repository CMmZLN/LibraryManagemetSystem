class ChangeAccountType < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :tel, :string
    change_column :users, :roll_no, :string
  end
end
