class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :business_name
      t.string :product_description
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
