class AddDateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :datepicker, :date
  end
end
