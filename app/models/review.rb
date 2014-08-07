class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :item
	belongs_to :author
	belongs_to :series	
end