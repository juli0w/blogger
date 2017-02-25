class AddDescriptionToBlogger < ActiveRecord::Migration[5.0]
  def change
    add_column :bloggers, :description, :string
  end
end
