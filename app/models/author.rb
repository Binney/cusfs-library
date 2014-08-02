class Author < ActiveRecord::Base
	has_many :items
	default_scope order('name ASC')

	def pretty_name
		# Names are stored in the database in the form "Surname, Forename" for alphabetical reasons. This function rearranges that into the format "Forename Surname".
		# Names of the form "Surname1, Forename1 & Surname2, Forename2" get rearranged into "Forename1 Surname1 and Forename2 Surname2".
		self.name.split(" & ").map { |s| s.split(',').reverse.join(" ").strip }.join(" and ")
	end
end
