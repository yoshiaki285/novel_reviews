class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books, id: false do |t|
      t.string :title
      t.string :author
      t.string :item_caption, limit: 255
      t.string :publisher_name
      t.string :sales_date
      t.bigint :isbn, null: false, primary_key: true
      t.string :medium_image_url
      t.string :large_image_url

      t.timestamps
    end
  end
end
