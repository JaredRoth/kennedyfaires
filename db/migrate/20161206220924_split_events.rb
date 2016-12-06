class SplitEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :year
    remove_column :events, :season
    remove_column :events, :title
    remove_column :events, :description

    remove_reference :events, :user, foreign_key: true
    remove_reference :events, :city, foreign_key: true
    add_reference :events, :faire, foreign_key: true
  end
end
