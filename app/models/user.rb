class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_achievements, dependent: :destroy
  has_many :achievements, dependent: :destroy
  has_many :own_achievements, through: :user_achievements

  belongs_to :coordinator, class_name: 'User', foreign_key: :coordinator_id, optional: true

  before_create :generate_token

  validates :first_name, :last_name, :email, :country, presence: true
  validates :coordinator, presence: true, if: :ambassador?

  enum role: { ambassador: 0, coordinator: 1, supervisor: 2 }

  def full_name
    "#{first_name.capitalize} #{last_name.upcase}"
  end

  private

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(token: random_token)
    end
  end
end
