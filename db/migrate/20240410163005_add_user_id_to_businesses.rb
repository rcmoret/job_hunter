class AddUserIdToBusinesses < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :user_id, :integer, null: true
  end
end
