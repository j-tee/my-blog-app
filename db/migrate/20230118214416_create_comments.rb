class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments, id: false do |t|
      t.string :text
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
    end
  end
end
