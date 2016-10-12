class CreateEventSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :event_spaces do |t|
      t.integer :number
      t.string :description
      t.boolean :electric
      t.references :vendor, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
