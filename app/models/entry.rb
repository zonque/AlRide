class Entry < ActiveRecord::Base
  TYPES = %w(offer request)

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :date
  validates_presence_of :seats
  validates_presence_of :from
  validates_presence_of :to

  validates_numericality_of :seats
  validates_inclusion_of :entry_type, in: TYPES
  validates_format_of :email, with: /\A.+@.+\z/
  validate :date_after_now

  def date_after_now
    if self.date and self.date < Time.now
      self.errors.add(:date, "should not be in the past")
    end
  end

  def is_request?
    self.entry_type.to_sym == :request
  end

  def is_offer?
    self.entry_type.to_sym == :offer
  end

  before_save :create_secret
  after_save :send_mail

  private

  def create_secret
    self.secret = SecureRandom.uuid
  end

  def send_mail
    UserMailer.entry_created(self).deliver_now
  end

end
