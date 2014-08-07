module TasksHelper
	def date_time_tag task
		raw "<span style='text-decoration: underline;'>#{ task.due_date.strftime("%B %d, %Y") }</span> - #{task.due_date.strftime("%I:%M %p")}"
	end

	def labels_list task
		labels_str= []
		task.labels.each do |label|
			labels_str <<  "<span class='#{Label::COLOR_CLASSES[label.color]}'>#{label.name}</span>"
		end
		labels_str.join(' ').html_safe
	end
end
