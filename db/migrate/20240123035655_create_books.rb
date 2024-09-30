class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :price
      t.integer :pages
      t.string :publisher
      t.integer :no_of_copies
      t.integer :availability

      t.timestamps
    end
  end
end
