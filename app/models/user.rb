class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validate :email_must_be_valid

  private

  def email_must_be_valid
      if email != nil
        if !email.match /.*@.*\..*/
          errors.add(:base, "Must be a valid email address")
        end
    end
  end
end