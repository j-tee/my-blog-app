class AddPrimaryKeyToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :id, :primary_key
  end
end
