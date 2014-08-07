class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :author_id, presence: true
  belongs_to :series # Each item can (but doesn't have to) be part of at most one Series.
  belongs_to :author # Each book is written by one author; "Robert Jordan" is an author, as is "Robert Jordan and Brandon Sanderson".
  MEDIA = %w[ Book Film Game Interpretative_Dance Other ]
  has_many :withdrawals
  has_many :reviews
  default_scope order("title ASC")

  def is_recommended?
  	true # TODO replace this with a search of the recommendations list for that item
  end

  def is_available?
  	self.withdrawals.length<self.editions.length
  end

end
