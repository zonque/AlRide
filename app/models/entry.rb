class Entry < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :date
  validates_presence_of :seats
  validates_presence_of :from
  validates_presence_of :to

  before_save :create_secret

  private

  def create_secret
    self.secret = SecureRandom.hex
  end
end
