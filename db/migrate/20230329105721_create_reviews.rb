class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :review
      t.boolean :is_exploded, null: false, default: false
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false

      t.timestamps
    end
    add_foreign_key :reviews, :books, column: :book_id, primary_key: :isbn
  end
end
