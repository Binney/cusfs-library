class Series < ActiveRecord::Base
  has_many :items
  default_scope order("name ASC")
end
