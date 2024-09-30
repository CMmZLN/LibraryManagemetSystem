class CreateBorrowRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :borrow_requests do |t|
      t.date :borrow_date
      t.date :due_date
      t.date :return_date
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
