class Item < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  TYPES = %w[ Book DVD Game Other ]
  has_many :withdrawals

  def is_recommended?
  	true # TODO replace this with a search of the recommendations list for that item
  end

  def is_available?
  	self.withdrawals.length<1
  end

end
