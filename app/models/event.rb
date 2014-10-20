class Event < ActiveRecord::Base
	ACTIVITIES = %w[ Film_screening Discussion Pub_meet Games_Night Speaker_event Cinema_trip Library_opening Other ]

	default_scope { order("time ASC") }
end
