class User < ApplicationRecord
  validates :email, :username, presence: true, uniqueness: true
  validates :username, length: { minimum: 6 }
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  validates :birth_date, :presence => true
  validate :validate_age

  private

  def validate_age
      if birth_date < 120.years.ago.to_date
          errors.add(:birth_date, 'can\'t be more than 120 years ago and can\'t be in the future')
      end
  end
end
