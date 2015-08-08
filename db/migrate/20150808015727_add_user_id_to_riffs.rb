class AddUserIdToRiffs < ActiveRecord::Migration
  def change
    add_reference :riffs, :user, index: true, foreign_key: true
  end
end
