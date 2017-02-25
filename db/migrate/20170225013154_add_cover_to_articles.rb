class AddCoverToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :cover, :string
  end
end
