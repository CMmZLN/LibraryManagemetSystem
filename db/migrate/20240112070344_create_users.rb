class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :gender
      t.integer :tel
      t.integer :roll_no
      t.string :acc_type

      t.timestamps
    end
  end
end
