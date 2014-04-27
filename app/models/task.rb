class Task < ActiveRecord::Base
  Done = 10
  Overdue = 1
  Status = ['Done', 'Overdue']

  def sub_tasks
    Task.where(parent_id: id)
  end
  
  def update_status(new_status)
    send("make_#{new_status}") if valid_status?(new_status)
  end

  def make_done
    update_attribute(:status, Done) unless done?
  end
  
  def valid_status?(new_status); Status.include?(new_status) end
  
  def done?; status == Done end
  
end
