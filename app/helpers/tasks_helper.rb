module TasksHelper
	def date_time_tag task
		raw "<span style='text-decoration: underline;'>#{ task.due_date.strftime("%B %d, %Y") }</span> - #{task.due_date.strftime("%I:%M %p")}"
	end

end
