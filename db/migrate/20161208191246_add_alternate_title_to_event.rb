class AddAlternateTitleToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :alternate_title, :text
  end
end
