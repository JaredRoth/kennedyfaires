class UpdateReferences < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :user, foreign_key: true
    add_reference :applications, :business, foreign_key: true
    add_reference :business_categories, :business, foreign_key: true
    add_reference :event_spaces, :business, foreign_key: true
  end
end
