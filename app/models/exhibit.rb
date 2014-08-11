class Exhibit < ActiveRecord::Base
	belongs_to :item
	belongs_to :collection
end
