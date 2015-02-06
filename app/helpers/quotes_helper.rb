module QuotesHelper

	def all_quotes
		quotes = []
		quotes[0] = Creation.all.where(medium: Creation::MEDIA[0]).first.name
		quotes[1] = "We Are Not A Cult"
		quotes[2] = "2.8% Less Meta Than Last Week"
		quotes[3] = "No More Czech Puppetry"
		quotes[4] = "Protection Against Routing By Bees"
		quotes[5] = "Patrick Stewart Carrying A Pug Into Battle"
		quotes[6] = "Possibly The Best Student-Run Science Fiction Library On The West Cambridge Site"
		quotes[7] = "Needs More Quotes"
		quotes[8] = "If You Have A Better Quote To Go Here, Do Let Me Know!"
		quotes[9] = "All Witty Quotes Eagerly Accepted"
		quotes[10] = "Part Of A Complete Breakfast"
		quotes[11] = "Made The Kessel Run In Eleven Parsecs"
		quotes[12] = "Wibbly-Wobbly Timey Wimey"
		quotes[13] = "***DON'T PANIC***"
		quotes[14] = "In Space, No One Can Hear You Play Board Games"
		quotes[15] = "Take That! Bloody Aliens"
		quotes[16] = "All Hail The Glow Cloud"
		quotes[17] = "Stoatally Revamped, Weaselly Recognisable"
		quotes[18] = "Running Out Of Quotes"
		quotes[19] = "SALMON BLAAAAAAAAST"
		quotes[20] = "Hodor Hodor Hodor, Hodor Hodor"
		return quotes
	end

end