class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, confirmation: true, length: {minimum: 6}, if: :password
  has_many :withdrawals
  has_many :reviews
  has_many :collections
  has_many :requests
  has_many :reservations
  accepts_nested_attributes_for :withdrawals
  default_scope { order('name ASC') }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def admin?
    self.admin
  end

  def has_withdrawn?(item)
    withdrawals.find_by(item_id: item.id)
  end

  def withdraw!(item, edition)
    withdrawals.create!(item_id: item, edition: edition) # TODO item id wat 
  end

  def about_me
    Faker::Lorem.paragraph(3)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
