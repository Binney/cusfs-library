class Series < ActiveRecord::Base
  has_many :items
  has_many :reviews
  default_scope {order("name ASC")}
end
