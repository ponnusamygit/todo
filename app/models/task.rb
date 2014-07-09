class Task < ActiveRecord::Base
	DONE = 'done'

	# check done or not
	def done?
		status == DONE
	end

	# check overdue
	def over_due?
		due_date > Time.now
	end

end
