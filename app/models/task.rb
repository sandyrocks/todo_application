class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  attr_accessible :name, :completed, :category_id, :datepicker, :endDate
  
  #scope :completed_tasks, where('completed IS NOT NULL AND user_id=session[:user_id]')
  scope :completed_tasks, lambda{|user_id,category_id| where("completed IS NOT NULL AND user_id = #{user_id} AND category_id = #{category_id}")}
  #scope :incomplete_tasks, where('completed IS NULL AND user_id is NOT null')
  scope :incomplete_tasks_category, lambda{|user_id,category_id| where("completed IS NULL AND user_id = #{user_id} AND category_id = #{category_id}")}
  scope :incomplete_tasks, lambda{|user_id| where("completed IS NULL AND user_id = #{user_id}")}
  scope :total_no_of_task, lambda {|user_id| where("user_id=#{user_id}")}
end
