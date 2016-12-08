class DeviseCreateVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendors do |t|
      ## Database authenticatable
      t.text :email,              null: false, default: ""
      t.text :encrypted_password, null: false, default: ""

      ## Recoverable
      t.text   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.text   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.text   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.text   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      t.text :first_name
      t.text :last_name
      t.text :business
      t.text :product
      t.integer :phone

      t.timestamps null: false
    end

    add_index :vendors, :email,                unique: true
    add_index :vendors, :reset_password_token, unique: true
    add_index :vendors, :confirmation_token,   unique: true
    add_index :vendors, :unlock_token,         unique: true
  end
end
