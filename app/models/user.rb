class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true
  has_many :alert_schedules, foreign_key: :creator_id

  def full_name
    if first_name and last_name
      [first_name, last_name].join(" ")
    else
      email
    end
  end
end
