class UpdateReferences < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :user, foreign_key: true
    add_reference :applications, :user, foreign_key: true
    add_reference :business_categories, :user, foreign_key: true
    add_reference :event_spaces, :user, foreign_key: true
  end
end
