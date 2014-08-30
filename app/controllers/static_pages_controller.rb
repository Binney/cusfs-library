class StaticPagesController < ApplicationController
  def home
  end

  def search
    unless params[:q].nil?
    	@items = Item.search(title_or_author_name_cont: params[:q]).result.paginate(page: params[:items_page])

    	@authors = Author.search(name_cont: params[:q]).result.paginate(page: params[:authors_page])

      # TODO would be nice if series also reacted to author name, ie if Authors have many Series.
      # That would require a more complex relationship though, due to series with multiple
      # authors (Robert freaking Jordan I AM LOOKING AT YOU HERE.)
    	@series = Series.search(name_cont: params[:q]).result.paginate(page: params[:series_page])

    	@users = User.search(name_cont: params[:q]).result.paginate(page: params[:users_page])

      # TODO also would be awesome to search for collection names and genres here.
    end
  end

  def help
  end

  def contact
  end

  def about
  end
end
