class Entry < ActiveRecord::Base

  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :date
  validates_presence_of :seats
  validates_presence_of :from
  validates_presence_of :to

  validates_numericality_of :seats
  validates_format_of :email, with: EMAIL_REGEXP
  validate :date_after_now

  def date_after_now
    if self.date
      self.errors.add(:date, "should not be in the past") if self.date < Time.now
    end
  end

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
