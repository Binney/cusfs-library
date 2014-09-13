module UsersHelper

	def avatar_for user
		if user.admin?
			image_tag "avatar_committee.png", alt: user.name, size: '52x52'
		else
			image_tag "avatar_default.png", alt: user.name, size: '52x52'
		end
	end

end
