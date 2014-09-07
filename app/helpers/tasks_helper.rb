module TasksHelper
	def date_time_format task
		raw "<span style='text-decoration: underline;'>#{ task.due_date.strftime("%B %d, %Y") }</span> - #{task.due_date.strftime("%I:%M %p")}"
	end

	def labels_list task
		labels_str= []
		task.labels.each do |label|
			labels_str <<  "<span class='#{Label::COLOR_CLASSES[label.color]}'>#{label.name}</span>"
		end
		labels_str.join(' ').html_safe
	end

	def current_user_tasks_include_labels
		tasks_labels = current_user.tasks.includes(:labels)
		tasks_labels.map do |task|
			task.attributes.merge({
				labels_classes: task.labels.map do |label|
						{name: label.name, color_class: Label::COLOR_CLASSES[label.color]}				
					end 
				})
		end 
	end
end
