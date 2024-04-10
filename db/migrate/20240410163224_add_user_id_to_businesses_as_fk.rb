class AddUserIdToBusinessesAsFk < ActiveRecord::Migration[7.0]
  def change
    remove_index :businesses, :name
    add_index :businesses, %i[name user_id], unique: true
    change_column_null :businesses, :user_id, false
    add_foreign_key :businesses, :users, column: :user_id
  end
end
