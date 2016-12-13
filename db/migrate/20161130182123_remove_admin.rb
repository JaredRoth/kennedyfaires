class RemoveAdmin < ActiveRecord::Migration[5.0]
  def change
    remove_reference(:events, :admin, {:foreign_key=>true})

    remove_index(:admins, {:column=>:unlock_token})
    remove_index(:admins, {:column=>:reset_password_token})
    remove_index(:admins, {:column=>:email})
    
    drop_table(:admins)
  end
end
