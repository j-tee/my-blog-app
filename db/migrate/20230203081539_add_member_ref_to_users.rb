class AddMemberRefToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :member, null: false, foreign_key: true,default: 8
  end
end
