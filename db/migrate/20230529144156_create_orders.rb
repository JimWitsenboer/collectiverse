class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :address
      t.string :state
      t.string :country
      t.string :status
      t.references :buyer_id, index: true, foreign_key: { to_table: :users }
      t.references :toy, null: false, foreign_key: true
      t.timestamps
    end
  end
end
