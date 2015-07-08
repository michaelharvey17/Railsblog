class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :content
      t.datetime :createdate

      t.timestamps null: false
    end
  end
end
