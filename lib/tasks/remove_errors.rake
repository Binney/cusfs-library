namespace :db do
	desc "Testing environment and variables"
	task :remove_errors, [:until]  => :environment  do |t, args|
	  args.with_defaults(:until => 1)
	  Item.order("created_at DESC")[0..args.until].each do |item|
	    puts item.title + " has a problem"
	  end
	end
end
