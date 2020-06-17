class AddUserIdToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :user_id, :integer
    add_column :places, :admin_id, :integer
  end
end
