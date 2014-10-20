module UsersHelper

	def mini_avatar_for user
		if user.admin?
			image_tag "avatar_committee.png", alt: user.name, size: '52x52'
		else
			image_tag "avatar_default.png", alt: user.name, size: '52x52'
		end
	end

	def avatar_for user
		if user.admin?
			image_tag "avatar_committee.png", alt: user.name, size: '150x150'
		else
			image_tag "avatar_default.png", alt: user.name, size: '150x150'
		end
	end

end
