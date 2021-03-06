class CreateFaires < ActiveRecord::Migration[5.0]
  def change
    create_table :faires do |t|
      t.text :title
      t.text :description
      t.references :city, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
