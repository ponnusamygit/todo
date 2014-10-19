module LabelsHelper
	def current_user_labels
		json_hash = []
		labels = current_user.labels.with_task_count
		labels.each do |label|
			json_hash << label.attributes.merge({btn_class: Label::BTN_CLASSES[label.color], label_class: Label::COLOR_CLASSES[label.color]})
		end
		json_hash.uniq
	end
end
