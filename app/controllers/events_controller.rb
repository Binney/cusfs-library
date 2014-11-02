class EventsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def new
  	@event = Event.new
  end

  def create
  	@event = Event.new(event_params)
  	if @event.save 
      flash[:success] = "Successfully added " + @event.name + " to the schedule!"
      redirect_to @event
  	else
  	  render 'new'
  	end
  end

  def show
  	@event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params) 
      flash[:success] = "Updated entry."
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:success] = "Event destroyed."
      redirect_to events_path
    else
      flash[:error] = "Couldn't destroy event!"
      redirect_to @event
    end
  end

  def index
    @events = Event.all.where(activity: "Library_opening")
    @forthcoming_events = Event.all.select{ |ev| ev.time>Time.now }.paginate(page: params[:forthcoming_page])
    @past_events = Event.all.select{ |ev| ev.time<Time.now }.paginate(page: params[:past_page])
    @title = "Schedule"
    @explanation = "CUSFS has a busy schedule during term and a less impressive but nonetheless nonzero number of events on outside of term."
  end

  def discussions
    @events = Event.all.where(activity: "Discussion")
    @forthcoming_events = @events.select{ |ev| ev.time>Time.now }.paginate(page: params[:forthcoming_page])
    @past_events = @events.select{ |ev| ev.time<Time.now }.paginate(page: params[:past_page])
    @title = "Discussions"
    @explanation = "Our Sunday evening discussion groups are the core of our termtime activities. We meet at 7:30pm (and are usually done by 11, though this figure wanders around somewhat) to discuss science fiction and fantasy in any format; recent topics have ranged from time travel to dragons to supervillains to dwarven sociology. Occasionally we even stay on topic long enough to get some real insight into the genre before veering off on tangents into narwhals and the most recent Doctor Who.<br>
    I emphasise that discussions are completely informal events. Often there are cookies. Always there is silliness. You're not expected to have read the complete works of Isaac Asimov or be up to date on Game of Thrones. Discussions are a great way to get to know the society and to learn about a whole range of exciting new books with which to fill your reading list."
    render 'index'
  end

  def screenings
    @events = Event.all.where(activity: "Film_screening")    
    @forthcoming_events = @events.select{ |ev| ev.time>Time.now }.paginate(page: params[:forthcoming_page])
    @past_events = @events.select{ |ev| ev.time<Time.now }.paginate(page: params[:past_page])
    @title = "Film and TV screenings"
    @explanation = "CUSFS usually shows one film every week during term. We try to have a unified theme for each term, though the links may be somewhat tenuous depending what we want to watch. All film screenings are completely free for everyone, and at the right time of year screenings will usually be followed by an episode of University Challenge or Game of Thrones.<br>The theme for Michaelmas 2015 is Franchises: from adaptations of super-successful books to the films that began entire subcultures. The idea is that they are must-see classics which, in many cases, people haven't actually seen, but have always sort of wanted to."
    render 'index'
  end

  def library_openings
    @events = Event.all.where(activity: "Library_opening")
    @forthcoming_events = @events.select{ |ev| ev.time>Time.now }.paginate(page: params[:forthcoming_page])
    @past_events = @events.select{ |ev| ev.time<Time.now }.paginate(page: params[:past_page])
    @title = "Library openings"
    @explanation = "The Librarian holds openings reasonably frequently during term. Come to browse our extensive collection! If you can't make it, you can request items online."
    # TODO put links in this explanation
    render 'index'
  end

  def pub_meets
    @events = Event.all.where(activity: "Pub_meet")
    @forthcoming_events = Event.all.where(activity: "Pub_meet").select{ |ev| ev.time>Time.now }.paginate(page: params[:forthcoming_page])
    @past_events = Event.all.where(activity: "Pub_meet").select{ |ev| ev.time<Time.now }.paginate(page: params[:past_page])
    @title = "Pub meets"
    @explanation = "CUSFS goes to the pub roughly once a week. While historically it's been the Bathhouse or the Anchor, at the moment we're regulars at the Castle on Castle Street, which is friendly, cheap (by Cambridge standards) and does an excellent veggie burger. Find us (normally) upstairs on big table to the left."
    render 'index'
  end

  def speaker_events
    @events = Event.all.where(activity: "Speaker_event")
    @forthcoming_events = @events.select{ |ev| ev.time>Time.now }.paginate(page: params[:forthcoming_page])
    @past_events = @events.select{ |ev| ev.time<Time.now }.paginate(page: params[:past_page])
    @title = "Speaker events"
    @explanation = "Once in a blue moon CUSFS does speaker events. We invite authors, directors, designers, and so on to speak, and in the past we have hosted the likes of Douglas Adams and Alastair Reynolds. While this isn't a regular thing, we'll advertise as much as possible every time one does come around!"
    render 'index'
  end

  def cinema_trips
    @events = Event.all.where(activity: "Cinema_trip")
    @forthcoming_events = @events.select{ |ev| ev.time>Time.now }.paginate(page: params[:forthcoming_page])
    @past_events = @events.select{ |ev| ev.time<Time.now }.paginate(page: params[:past_page])
    @title = "Cinema trips"
    @explanation = "For each vaguely science-fiction-y or fantasy-related movie that comes out, you can usually expect a CUSFS delegation to go and see it at some point at Cambridge Vue (Grafton Centre, east past Emmanuel) or Cineworld (The Junction, south past the train station). Orange Wednesday tickets and other money-off vouchers are particularly welcome."
    render 'index'
  end

  def games_nights
    @events = Event.all.where(activity: "Games_Night")
    @forthcoming_events = @events.select{ |ev| ev.time>Time.now }.paginate(page: params[:forthcoming_page])
    @past_events = @events.select{ |ev| ev.time<Time.now }.paginate(page: params[:past_page])
    @title = "Games Nights"
    @explanation = "CUSFS's famous* Games Nights are the highlight** of any term! We meet early evening (8pm or so) and play board games, card games, word games, role-playing games, until sunrise. Pizza can be expected at about 3am. These usually are great fun for all concerned, regulars and casual members alike, and we often have guests from Cambridge <a href='http://cam.treasuretrap.co.uk/'>LARP</a>, <a href='http://www.rpg-soc.ucam.org/'>CURS</a>, or even as far as <a href='https://www.union.ic.ac.uk/scc/icsf/'>other</a> <a href='http://users.ox.ac.uk/~ousfg/'>universities</a>.<br>
    <small>*Definition may vary. Significantly.<br>
    **Other than all the other CUSFS events you are doubtless already attending.</small>"
    render 'index'
  end

  private

	  def event_params
		  params.require(:event).permit(:name, :time, :end_time, :description, :location, :activity, :image_url)	  	
	  end

end
