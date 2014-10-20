class Creation < ActiveRecord::Base
	validates :name, presence: true
	validates :url, presence: true
  	default_scope { order("created_at DESC") }

	MEDIA = %w[ TTBA artwork chainstory other ]
end
