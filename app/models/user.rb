class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :resources, dependent: :destroy
  has_many :user_missions, dependent: :destroy
  has_many :missions, dependent: :destroy
  has_many :own_missions, through: :user_missions, source: :mission

  has_many :user_achievements, dependent: :destroy
  has_many :achievements, dependent: :destroy
  has_many :own_achievements, through: :user_achievements, source: :achievement

  belongs_to :coordinator, class_name: 'User', foreign_key: :coordinator_id, optional: true

  belongs_to :country

  before_create :generate_token

  after_create :add_amb_points

  after_update :check_achievements, if: :saved_change_to_score?

  validates :first_name, :last_name, :email, :country, :role, presence: true
  validates :coordinator, presence: true, if: :ambassador?

  delegate :code, to: :country

  enum role: { ambassador: 0, coordinator: 1, supervisor: 2 }

  def full_name
    "#{first_name.capitalize} #{last_name.upcase}"
  end

  def self.best(attrs)
    where(role: attrs[:role])
      .order(score: :desc)
      .limit(attrs[:number])
  end

  def rank
    User.where(role: role)
        .order(score: :desc)
        .index(self) + 1
  end

  def str_rank
    users = User.where(role: role)
      .order(score: :desc)
    "#{ users.index(self) + 1 } / #{ users.size }"
  end


  private

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(token: random_token)
    end
  end

  def check_achievements
    Achievement.all.where('required <= ?', score).find_each do |achievement|
      next if own_achievements.include?(achievement)
      UserAchievement.create(achievement: achievement, user: self)
    end
  end

  def add_amb_points
    return unless ambassador?
    coordinator.update(score: coordinator.score += 300)
  end
end
