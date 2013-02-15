class AddColumnToTask < ActiveRecord::Migration
  def change
    t.references :user
 
  end
end
