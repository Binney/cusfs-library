class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :item
	belongs_to :author
	belongs_to :series
	default_scope { order('created_at DESC') }

	def topic_title
		if !self.item_id.nil?
			self.item.pretty_name
		elsif !self.author_id.nil?
			self.author.pretty_name
		elsif !self.series_id.nil?
			self.series.title
		else
			""
		end
	end

	def topic
		if !self.item_id.nil?
			self.item
		elsif !self.author_id.nil?
			self.author
		elsif !self.series_id.nil?
			self.series
		else
			self
		end
	end
end