require 'securerandom'

class ShortenedUrl < ApplicationRecord
  belongs_to :user

  validates :short_form, uniqueness: { message: :out_of_space }

  before_validation :generate_short_form, on: :create

  def count_visit
    self.visit_count += 1
    save!
  end

  private

  # Create a random short form. Use 4 random bytes, converted to Base64, and respin a few times if not unique.
  # This gives up to ~4 billion unique short URLs. Practically, this limit won't be reached, since we'll hit
  # clashes before that point.
  # If this does generate a duplicate, the uniqueness validation will catch it
  def generate_short_form
    candidate = nil
    3.times do
      candidate = SecureRandom.urlsafe_base64(4)
      break if ShortenedUrl.where(short_form: candidate).blank?
    end

    self.short_form = candidate
  end
end
