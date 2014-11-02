module CommitteesHelper

	def past_committees
    	[
		{
		  :current => true,
		  "year"       => "2014-2015",
		  "Chairbeing" => "Danielle Saunders (ds636)", 
		  "Secretary"  => "Sarah Binney (sb913)",
		  "Librarian"  => "Lizzie Colwill (ec504)",
		  "Treasurer"  => "Rory Hennell James (rh570)",
		  "Memsec"     => "Catherine Gray (cg508)",
		  "TTBA"       => "Isobel Sands (is361)",

		  "Reeve"      => "Margaret Young (mry25)", 
		  "Runecaster" => "Curtis Reubens (cr507)",
		  "Meadkeeper" => "Lizzie Colwill (ec504)",
		  "Geldjarl"   => "Rory Hennell James (rh570)",
		  "Bard"       => "Lilian Halstead (lah64)"
		},

		{
		  "year"      => "2013-2014",
		  "Chairbeing" => "Sarah Binney", 
		  "Secretary"  => "Filip Drnovšek Zorko",
		  "Librarian"  => "Will Bradshaw",
		  "Treasurer"  => "Imogen Gold",
		  "Memsec"     => "Tristan Roberts",
		  "TTBA"       => "Lilian Halstead",

		  "Reeve"      => "Will Bradshaw", 
		  "Runecaster" => "Lizzie Colwill",
		  "Meadkeeper" => "Tristan Roberts",
		  "Geldjarl"   => "Imogen Gold",
		  "Bard"       => "Danielle Saunders"
		},

		{
		  "year"      => "2012-2013",
		  "Chairbeing" => "Filip Drnovšek Zorko",
		  "Secretary"  => "James Robson",
		  "Librarian"  => "Christine Lee",
		  "Treasurer"  => "Imogen Gold",
		  "Memsec"     => "Fraiser McNair",
		  "TTBA"       => "Frederic Heath-Renn",

		  "Reeve"      => "Christine Lee", 
		  "Runecaster" => "Lost in the mists of time",
		  "Meadkeeper" => "Lost in the mists of time",
		  "Geldjarl"   => "Imogen Gold",
		  "Bard"       => "Lost in the mists of time"
		},

		{
		  "year"      => "Briefly 2012",
		  "Chairbeing" => "Frederic Heath-Renn",
		  "Secretary"  => "James Robson",
		  "Librarian"  => "Christine Lee",
		  "Treasurer"  => "Imogen Gold",
		  "Memsec"     => "Fraiser McNair",
		  "TTBA"       => "Dragneto",

		  "Reeve"      => "Lost in the mists of time", 
		  "Runecaster" => "Lost in the mists of time",
		  "Meadkeeper" => "Lost in the mists of time",
		  "Geldjarl"   => "Lost in the mists of time",
		  "Bard"       => "Lost in the mists of time"
		},

		{
		  "year"      => "2011-2012",
		  "Chairbeing" => "Roseanna Pendlebury",
		  "Secretary"  => "Rob Shaw-Edwards",
		  "Librarian"  => "James Robson",
		  "Treasurer"  => "Philip Bielby",
		  "Memsec"     => "Fraiser McNair",
		  "TTBA"       => "Frederic Heath-Renn",

		  "Reeve"      => "Amit Hazi", 
		  "Runecaster" => "Christine Lee",
		  "Meadkeeper" => "Alexander Guttenplan",
		  "Geldjarl"   => "Philip Bielby",
		  "Bard"       => "Hannah Wray"
		},

		{
		  "year"      => "2010-2011",
		  "Chairbeing" => "Alex Guttenplan",
		  "Secretary"  => "Elena Yudovina",
		  "Librarian"  => "Roseanna Pendlebury",
		  "Treasurer"  => "Philip Bielby",
		  "Memsec"     => "Simon Taylor",
		  "TTBA"       => "Amit Hazi",

		  "Reeve"      => "Christine Lee", 
		  "Runecaster" => "Roseanna Pendlebury",
		  "Meadkeeper" => "William Brooks",
		  "Geldjarl"   => "Philip Bielby",
		  "Bard"       => "Clemmy Plemming"
		},

		{
		  "year"      => "2009-2010",
		  "Chairbeing" => "Carol Sparke",
		  "Secretary"  => "Elena Yudovina",
		  "Librarian"  => "Roseanna Pendlebury",
		  "Treasurer"  => "Philip Bielby",
		  "Memsec"     => "Steven Shenton",
		  "TTBA"       => "James Brister",

		  "Reeve"      => "Roseanna Pendlebury", 
		  "Runecaster" => "Fraser McNair",
		  "Meadkeeper" => "Ed Morland",
		  "Geldjarl"   => "Philip Bielby",
		  "Bard"       => "James Brister"
		},

		{
		  "year"       => "2008-2009",
		  "Chairbeing" => "James Brister",
		  "Secretary"  => "Eve Mullen",
		  "Treasurer"  => "Philip Bielby",
		  "Memsec"     => "Will Brooks",
		  "Librarian"  => "Simeon Bird",
		  "TTBA"       => "Eve Mullen",

		  "Reeve"      => "Michael Donaghy", 
		  "Runecaster" => "Richard Gibson",
		  "Geldjarl"   => "Philip Bielby",
		  "Bard"       => "Carol Sparke",
		  "Meadkeeper" => "Steven Shenton"
		},

		{
		  "year"       => "2007-2008",
		  "Chairbeing" => "Michael Donaghy",
		  "Secretary"  => "Steven Shenton",
		  "Treasurer"  => "Jenny Scott-Thompson",
		  "Memsec"     => "Ben Weaver",
		  "Librarian"  => "Daniel Hulme (Custodian: Clare Boothby)",
		  "TTBA"       => "Post vacant",

		  "Reeve"      => "Simeon Bird", 
		  "Runecaster" => "Colin Love",
		  "Geldjarl"   => "Jenny Scott Thompson",
		  "Bard"       => "Daniel Hulme",
		  "Meadkeeper" => "Steven Shenton"
		},

		{
		  "year"       => "Emergency Holographic Committee of 2007 For One Term Only",
		  "Chairbeing" => "Simeon Bird",
		  "Secretary"  => "Michael Donaghy",
		  "Treasurer"  => "Joey Anrep",
		  "Memsec"     => "Daniel Hulme",
		  "Librarian"  => "Post vacant (Library Custodian: Clare Boothby)",
		  "TTBA"       => "Chris Halverson",

		  "Reeve"      => "Daniel Hulme", 
		  "Runecaster" => "Simeon Bird",
		  "Geldjarl"   => "Joey Anrep",
		  "Bard"       => "Matthew Woodcraft",
		  "Meadkeeper" => "Mark Waller"
		},

		{
		  "year"       => "2006-2007",
		  "Chairbeing" => "Peter Corbett",
		  "Secretary"  => "Helen 'Naath' Cousins",
		  "Treasurer"  => "Joey Anrep",
		  "Memsec"     => "Ian Jackson",
		  "Librarian"  => "Post vacant (Library Custodian: Clare Boothby)",
		  "TTBA"       => "Post vacant",

		  "Reeve"      => "Daniel Hulme", 
		  "Runecaster" => "Simeon Bird",
		  "Geldjarl"   => "Joey Anrep",
		  "Bard"       => "Matthew Woodcraft",
		  "Meadkeeper" => "Mark Waller"
		},

		{
		  "year"       => "2005-2006",
		  "Chairbeing" => "Clare Boothby",
		  "Secretary"  => "Felicity Boyce",
		  "Treasurer"  => "Mark Waller",
		  "Memsec"     => "Ian Jackson",
		  "Librarian"  => "Clare Boothby",
		  "TTBA"       => "Joy Goodman",

		  "Reeve"      => "Jack Vickeridge", 
		  "Runecaster" => "Clare Boothby",
		  "Geldjarl"   => "Mark Waller",
		  "Bard"       => "Joy Goodman",
		  "Meadkeeper" => "Alison Hart"
		},

		{
		  "year"       => "2004-2005",
		  "Chairbeing" => "Helen 'Naath' Cousins",
		  "Secretary"  => "David Morris",
		  "Treasurer"  => "Ian Jackson",
		  "Memsec"     => "Ian Jackson",
		  "Librarian"  => "Clare Boothby",
		  "TTBA"       => "Owen Dunn",

		  "Reeve"      => "Clare Boothby", 
		  "Runecaster" => "Jonathan Amery",
		  "Geldjarl"   => "Ian Jackson",
		  "Bard"       => "Owen Dunn",
		  "Meadkeeper" => "Daniel Hulme"
		},

		{
		  "year"       => "2003-2004",
		  "Chairbeing" => "Kate Stitt",
		  "Secretary"  => "Christine Clarke",
		  "Treasurer"  => "Helen 'Naath' Cousins",
		  "Memsec"     => "Ian Jackson",
		  "Librarian"  => "Clare Boothby",
		  "TTBA"       => "Owen Dunn",

		  "Reeve"      => "Helen 'Naath' Cousins", 
		  "Runecaster" => "Sally Clough",
		  "Geldjarl"   => "Helen 'Naath' Cousins",
		  "Bard"       => "Sarah Amery",
		  "Meadkeeper" => "Matthew Vernon"
		},

		{
		  "year"       => "2002-2003",
		  "Chairbeing" => "Kate Stitt",
		  "Secretary"  => "Tony Evans",
		  "Treasurer"  => "Peter Corbett",
		  "Memsec"     => "Ian Jackson",
		  "Librarian"  => "Clare Boothby",
		  "TTBA"       => "Gaute Strokkenes (to 16/2/03)
		Owen Dunn (from 16/2/03)",

		  "Reeve"      => "Jonathan Amery", 
		  "Runecaster" => "Clare Boothby",
		  "Geldjarl"   => "Peter Corbett",
		  "Bard"       => "Matthew Vernon",
		  "Meadkeeper" => "Dan Sheppard"
		},

		{
		  "year"       => "2001-2002",
		  "Chairbeing" => "Matthew Vernon",
		  "Secretary"  => "Kate Stitt",
		  "Treasurer"  => "Tom Davidson",
		  "Memsec"     => "Ian Jackson",
		  "Librarian"  => "Gaute Strokkenes",
		  "TTBA"       => "Dan Sheppard",

		  "Reeve"      => "Matthew Vernon", 
		  "Runecaster" => "Jonathan Amery",
		  "Geldjarl"   => "Tom Davidson",
		  "Bard"       => "Sion Arrowsmith",
		  "Meadkeeper" => "Dan Sheppard"
		},

		{
		  "year"       => "2000-2001",
		  "Chairbeing" => "Sebastian Bleasdale",
		  "Secretary"  => "Mark Waller",
		  "Treasurer"  => "Jonathan Amery",
		  "Memsec"     => "Matthew Vernon",
		  "Librarian"  => "Gaute Strokkenes",
		  "TTBA"       => "Steven Kitson",

		  "Reeve"      => "Mark Waller", 
		  "Runecaster" => "Matthew Vernon",
		  "Geldjarl"   => "Jonathan Amery",
		  "Bard"       => "Sion Arrowsmith",
		  "Meadkeeper" => "Steven Kitson (Vestrfari: Emma Burt)"
		}
		]

    end


end