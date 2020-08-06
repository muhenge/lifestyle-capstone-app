class AddAuthorIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :authorid, :string
    add_column :articles, :integer, :string
  end
end
