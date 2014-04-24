class Task < ActiveRecord::Base
  Done = 'Done'
  Overdue = 'Overdue'
  def sub_tasks
    Task.where(parent_id: id)
  end
  
end
