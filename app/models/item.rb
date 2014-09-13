class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :author_id, presence: true
  belongs_to :series # Each item can (but doesn't have to) be part of at most one Series.
  belongs_to :author # Each book is written by one author; "Robert Jordan" is an author, as is "Robert Jordan and Brandon Sanderson".
  MEDIA = %w[ Fiction GraphicNovel TieIn Anthology NonFiction Film Game Interpretative_Dance Other ]
  has_many :withdrawals
  has_many :reviews
  has_many :collections, through: :exhibits
  has_many :exhibits
  default_scope order("title ASC")

  def chop_articles_from_title
    # Remove "the", "a", and "an" from the start of item titles so they are listed alphabetically by first non-article word.
    # e.g. "A Game of Thrones" => "Game of Thrones, A"
    if self.title[0..1]=="A " || self.title[0..1]=="a "
      self.title[2..self.title.length] + ", A"
    elsif self.title[0..2]=="An " || self.title[0..2]=="an "
      self.title[3..self.title.length] + ", An"
    elsif self.title[0..3]=="The " || self.title[0..3]=="the "
      self.title[4..self.title.length] + ", The"
    else
      self.title
    end
  end

  def pretty_name
    # The reverse of the above - given names are stored in the format "Game of Thrones, A" so as to be indexed under G not A;
    # to return proper title, take the article off the end of the string and return "A Game of Thrones". For use in views, etc.
    if self.title[-3..-1]==", A"
      "A "+self.title[0..-4]
    elsif self.title[-4..-1]==", An"
      "An "+self.title[0..-5]
    elsif self.title[-5..-1]==", The"
      "The "+self.title[0..-6]
    else
      self.title
    end
  end

  def is_recommended?
  	true # TODO replace this with a search of the recommendations list for that item
  end

  def is_available?
  	self.withdrawals.length<self.editions.length
  end

  def add_edition(editioncode)
    if self.editions.include?(String(editioncode))
      puts "[WARNING] Item.rb: Can't update #{title} with edition #{editioncode} as that edition is already in the library."
    else
      update_attribute(:editions, self.editions + editioncode)
    end
  end

  def average_rating
    if self.reviews.any?
      t = 0;
      n = 0;
      self.reviews.each do |r|
        t += r.rating.to_i
        n += 1
      end
      (t/n).round
    else
      nil
    end
  end

end
