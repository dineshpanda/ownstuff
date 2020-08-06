class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.text :content
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
