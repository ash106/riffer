class Riff < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :audio, presence: true
  has_attached_file :audio
  validates_attachment_content_type :audio, content_type: /\Aaudio\/.*\Z/
  scope :most_recent, -> { order(created_at: :desc) }
end
