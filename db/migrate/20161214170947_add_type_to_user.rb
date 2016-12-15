class AddTypeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :type, :string, default: 'Vendor'
    remove_column :users, :admin
  end
end
