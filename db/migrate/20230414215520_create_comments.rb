class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :review_id
      t.boolean :is_exploded_c, null: false, default: false

      t.timestamps
    end
  end
end
