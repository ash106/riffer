class User < ActiveRecord::Base
  has_many :riffs, dependent: :destroy
  validates :username, presence: true, length: { minimum: 3, maximum: 20 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
