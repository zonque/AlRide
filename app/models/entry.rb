class Entry < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :date
  validates_presence_of :seats
  validates_presence_of :from
  validates_presence_of :to

  before_save :create_secret
  after_save :send_mail

  private

  def create_secret
    self.secret = SecureRandom.uuid
  end

  def send_mail
    UserMailer.entry_created(self).deliver
  end

end
