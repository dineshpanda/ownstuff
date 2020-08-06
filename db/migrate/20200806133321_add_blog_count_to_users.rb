class AddBlogCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :blogs_count, :integer
  end
end
