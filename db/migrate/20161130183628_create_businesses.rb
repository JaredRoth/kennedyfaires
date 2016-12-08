class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.text :business_name
      t.text :product_description
      t.text :street_address
      t.text :city
      t.text :state
      t.integer :zip
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
