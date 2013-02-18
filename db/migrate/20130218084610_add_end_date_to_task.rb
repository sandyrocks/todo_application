class AddEndDateToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :endDate, :date
  end
end
