class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true,
            format: {with: URI::MailTo::EMAIL_REGEXP},
            uniqueness: true
  validates :password, confirmation: true, presence: true
  validates :password_confirmation, presence: true

  def self.from_token_payload payload
    # Returns a valid user, `nil` or raise
    # e.g.
      find payload["sub"]
  end
end
