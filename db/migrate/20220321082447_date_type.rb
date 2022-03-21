class DateType < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :date, :datetime
    change_column_null :events, :date, false
    remove_column :events, :hour
  end
end
