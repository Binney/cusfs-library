class StaticPagesController < ApplicationController
  before_action :admin_user, only: :administration

  def home
    @items = Item.all.shuffle[0..5]
    offset = rand(11)
    @collection = Collection.first(offset: offset)
    @forthcoming_events = Event.all.select{ |ev| ev.time>Time.now }[0..2]
  end

  def search
    unless params[:q].nil?
    	@items = Item.search(title_or_author_name_cont: params[:q]).result.paginate(page: params[:items_page])

    	@authors = Author.search(name_cont: params[:q]).result.paginate(page: params[:authors_page])

      # TODO would be nice if series also reacted to author name, ie if Authors have many Series.
      # That would require a more complex relationship though, due to series with multiple
      # authors (Robert freaking Jordan I AM LOOKING AT YOU HERE.)
    	@series = Series.search(name_cont: params[:q]).result.paginate(page: params[:series_page])

      @creations = Creation.search(keywords_cont: params[:q]).result.paginate(page: params[:page])
      
    	@users = User.search(name_cont: params[:q]).result.paginate(page: params[:users_page])

      # TODO also would be awesome to search for collection names and genres here.
    end
  end

  def library_home
    #@recommendations = Item.all.where(average_rating > 3).shuffle[0..5]
    @library_size = Item.count
    @fiction_size = Item.where(medium: Item::MEDIA[0]).length
    @films_size = Item.where(medium: Item::MEDIA[5]).length
    @graphic_novels_size = Item.where(medium: Item::MEDIA[1]).length

    @reviews = Review.all[0..4]
    offset = rand(11)
    @collection = Collection.first(offset: offset)

    offset = rand(Item.count)
    @item = Item.first(offset: offset)

    @event = Event.all.where(activity: "Library_opening").select{ |ev| ev.time>Time.now }.first

  end

  def help
  end

  def contact
  end

  def about
  end

  def committee
  end

  def constitution
  end

  def membership
  end

  def links
  end

  def administration
  end

end
