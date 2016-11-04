class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.integer :status
      t.integer :spaces_amount
      t.boolean :chamber
      t.boolean :electric
      t.references :vendor, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
