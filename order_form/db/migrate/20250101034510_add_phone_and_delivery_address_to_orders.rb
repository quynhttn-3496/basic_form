class AddPhoneAndDeliveryAddressToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :phone, :string, null: false, comment: '電話番号'
    add_column :orders, :delivery_address, :string, null: false, comment: '配送先住所'
  end
end
