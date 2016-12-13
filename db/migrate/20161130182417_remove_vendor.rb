class RemoveVendor < ActiveRecord::Migration[5.0]
  def change
    remove_reference(:applications, :vendor, {:foreign_key=>true})
    remove_reference(:event_spaces, :vendor, {:foreign_key=>true})
    remove_reference(:vendor_categories, :vendor, {:foreign_key=>true})

    remove_index(:vendors, {:column=>:confirmation_token})
    remove_index(:vendors, {:column=>:unlock_token})
    remove_index(:vendors, {:column=>:reset_password_token})
    remove_index(:vendors, {:column=>:email})
    
    drop_table(:vendors)
  end
end
