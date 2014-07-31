class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  belongs_to :series # Each item can (but doesn't have to) be part of at most one Series.
  MEDIA = %w[ Book Film Game Interpretative_Dance Other ]
  has_many :withdrawals

  def is_recommended?
  	true # TODO replace this with a search of the recommendations list for that item
  end

  def is_available?
  	self.withdrawals.length<self.editions.length
  end

end
