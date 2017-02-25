class CreateBloggers < ActiveRecord::Migration[5.0]
  def change
    create_table :bloggers do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :slug

      t.timestamps
    end
  end
end
