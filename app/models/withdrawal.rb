class Withdrawal < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  default_scope { order("created_at ASC") }
end
