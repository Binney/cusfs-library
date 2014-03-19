class Item < ActiveRecord::Base
	validates :title, presence: true
	validates :author, presence: true
	TYPES = %w[ book dvd game other ]
end
