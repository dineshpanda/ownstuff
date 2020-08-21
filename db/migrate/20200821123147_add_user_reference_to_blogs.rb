class AddUserReferenceToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :blogs, :users    add_index :blogs, :user_id    change_column_null :blogs, :user_id, false
  end
end
