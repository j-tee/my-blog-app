class RemoveUserRefFromMembers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :members, :user, null: false, foreign_key: true
  end
end
