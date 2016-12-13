class AddAdminToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :admin, foreign_key: true
  end
end
