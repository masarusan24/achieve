class AddBlogToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :blog, foreign_key: true
  end
end
