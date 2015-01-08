class Committee < ActiveRecord::Base
  	default_scope { order("start_year DESC") }

	def current?
		!(self.successor)
	end

	def previous
		puts "Finding previous committee for #{self.start_year}"
		Committee.where("start_year < ?", self.start_year).first
	end

	def successor
		puts "Finding successor committee for #{self.start_year}"
		Committee.where("start_year > ?", self.start_year).last
	end

end
