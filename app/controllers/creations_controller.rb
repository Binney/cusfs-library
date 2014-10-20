class CreationsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def new
    @creation = Creation.new
  end

  def create
    @creation = Creation.new(creation_params)
    if @creation.save
      flash[:success] = "Added #{@creation.name} to the Creative section!"
      redirect_to @creation
    else
      render 'new'
    end
  end

  def edit
    @creation = Creation.find(params[:id])
  end

  def update
    @creation = Creation.find(params[:id])
    if @creation.update_attributes(creation_params)
      flash[:success] = "Entry updated."
      redirect_to @creation
    else
      render 'edit'
    end
  end

  def index
    @creations = Creation.all.paginate(page: params[:page])
    @title = "Creative"
    @explanation = ""
  end

  def ttba
    @creations = Creation.all.where(medium: Creation::MEDIA[0]).paginate(page: params[:page])
    @title = "TTBA Magazine"
    @explanation = "TTBA is the official CUSFS magazine. It dates, in some form or another, to 1974, when the title acronym stood for Title To Be Announced; nobody ever got around to said announcement, and now the acronym stands for something different every issue. The regularity of publication varies widely depending who is in charge, but usually we see between one and three editions per year.<br>
      The magazine consists of submissions from anybody - members or not - of virtually anything: stories, poetry, reviews, comics, analyses, art, and anything else that might tangentially be of interest to the society. If you're interested in contributing and thus bringing joy to the CUSFS world - which of course you are - email the editor at soc-cusfs-ttba (at) lists (dot) cam (dot) ac (dot) uk.<br>
      Past editions are indexed below. Coverage is quite patchy before about 2009 so if you know of or have access to any TTBAs from before that do get in touch - we'd love to have a look!"
    render 'index'
  end

  def chainwriting
    @creations = Creation.all.where(medium: Creation::MEDIA[2]).paginate(page: params[:page])
    @title = "Chainwriting"
    @explanation = "We run chainwriting sessions during and outside of term. This is where one person writes a 250-word opening to a story, then passes it on to someone else, who adds another 250 words - and so on. Most chains have in the region of 10 people in, so a decent length story develops which can be anything from an internally consistent and enjoyable work of fiction to a bizarre hotchpotch of different writing styles. All chains get published in TTBA when they're done.<br>
    We've also held experimental chains, for example writing a story backwards (the first person writes the end of a story, then passes it on to someone who writes the penultimate section, etc), or a choose-your-own-adventure chain where upon completion of each segment the chain is sent to two different people. Some of these......work better than others. Suggestions for future formatting experiments are welcome!<br>
    Signups for chainwriting are circulated at the start of each term (except during Easter, because of exams) via the mailing list and on Facebook. You can sign up for as many or as few chains as you like (but you're only allowed to write one section per chain), and can be anonymous if you like.<br>
    Here are the best of our past chainwriting sessions, along with some experimental ones which didn't fit into TTBA."
    render 'index'
  end

  def art
    @creations = Creation.all.where(medium: Creation::MEDIA[1]).paginate(page: params[:page])
    @title = "Art"
    @explanation = "Here will be a gallery of art works in a variety of visual media by CUSFS members."
    render 'index'
  end

  def show
    @creation = Creation.find(params[:id])
  end

  private

    def creation_params
      params.require(:creation).permit(:name, :description, :created_at, :medium, :url, :keywords)
    end

end