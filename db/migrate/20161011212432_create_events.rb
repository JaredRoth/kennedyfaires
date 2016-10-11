class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :year
      t.string :season
      t.string :title
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
