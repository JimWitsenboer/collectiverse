class ChangeBuyerIdToUserIdOrders < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :buyer_id_id, :user_id
  end
end
