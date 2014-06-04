class User < ActiveRecord::Base
	before_save { self.email = email.downcase if email }
	before_create :create_remember_token
    self.table_name = "Users"
    self.primary_key = "id_user"
	has_many :schedules, :class_name => 'Schedule'
	belongs_to :specialization, :class_name => 'Specialization'
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 6 }
    def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
