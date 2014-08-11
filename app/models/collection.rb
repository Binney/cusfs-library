class Collection < ActiveRecord::Base
	belongs_to :user
	has_many :items, through: :exhibits
	has_many :exhibits
	accepts_nested_attributes_for :exhibits, :allow_destroy => true

	def add_item(item)
		exhibits.create!(item_id: item.id)
	end

	def remove_item(item)
		exhibits.find_by(item_id: item.id).destroy
	end

	def contains?(item)
		exhibits.find_by(item_id: item.id)
	end

end