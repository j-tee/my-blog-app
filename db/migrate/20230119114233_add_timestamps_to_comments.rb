class AddTimestampsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :created_at, :datetime, null: false
    add_column :comments, :updated_at, :datetime, null: false
  end
end
