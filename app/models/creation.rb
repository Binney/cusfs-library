class Creation < ActiveRecord::Base
	validates :name, presence: true
	validates :url, presence: true

	MEDIA = %w[ TTBA artwork chainstory other ]
end
