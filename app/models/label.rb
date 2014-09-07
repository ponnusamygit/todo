class Label < ActiveRecord::Base
	has_and_belongs_to_many :tasks
	belongs_to :user

	COLORS = %w(red blue orange green gray)
	COLOR_CLASSES = {'red' => 'label label-danger', 
		'blue' => 'label label-info', 'orange' => 'label label-warning', 
		'green' => 'label label-success', 'gray' => 'label label-default'}
	BTN_CLASSES = {'red' => 'btn btn-danger', 
		'blue' => 'btn btn-info', 'orange' => 'btn btn-warning', 
		'green' => 'btn btn-success', 'gray' => 'btn btn-gray'}

	validates :color, :inclusion => COLORS

	scope :with_task_count, -> { 
							joins("left join labels_tasks on labels_tasks.label_id=labels.id left join tasks on tasks.id = labels_tasks.task_id")
						.group('tasks.id, labels.id').select("count(tasks.id) as task_count, labels.id, labels.name, labels.color")}
	
end
