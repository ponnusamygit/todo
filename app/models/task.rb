class Task < ActiveRecord::Base
	DONE = 'done'
	OVERDUE = 'overdue'
	UPCOMMING = 'upcomming'

	has_and_belongs_to_many :labels

	# Group the task depends status
	def self.group_by_due user
		where(user_id: user.id).group_by{|task| task.current_groupby_status}
	end

	# Get current status for group intex page
	def current_groupby_status
		if done?
			DONE
		elsif over_due?
			OVERDUE
		else
			UPCOMMING
		end
	end

	# check done or not
	def done?
		status == DONE
	end

	# check overdue
	def over_due?
		due_date > Time.now
	end

end
