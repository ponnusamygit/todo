class Label < ActiveRecord::Base
	has_and_belongs_to_many :tasks
	belongs_to :user

	COLORS = %w(red blue orange green gray)
	COLOR_CLASSES = {'red' => 'label label-danger', 
		'blue' => 'label label-info', 'orange' => 'label label-warning', 
		'green' => 'label label-success', 'gray' => 'label label-default'}

	validates :color, :inclusion => COLORS

end
