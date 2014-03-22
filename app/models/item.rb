class Item < ActiveRecord::Base
	validates :title, presence: true
	validates :author, presence: true
	TYPES = %w[ Book DVD Game Other ]
end
