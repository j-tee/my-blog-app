class AddUserToMember < ActiveRecord::Migration[7.0]
  def change
    add_reference :members, :user, null: false, foreign_key: true, default: 12
  end
end
