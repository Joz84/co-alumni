class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :resources #, inverse_of: :supervisor
  has_many :missions
  has_many :user_missions
  has_many :my_missions, through: :user_missions
  belongs_to :country

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :generate_token

  private

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(token: random_token)
    end
  end

  def self.best(attrs)
    where( role: attrs[:role] )
    .order(score: :desc)
    .limit( attrs[:number] )
  end

end
