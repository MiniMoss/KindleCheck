class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :authentication_tokens

  def self.confirm_password credentials
    token = where(email: credentials[:email]).first
    token if token && token.password_confirmed?(credentials[:password])
  end

  def password_confirmed? password
    BCrypt::Password.new(encrypted_password) == password
  end
end
