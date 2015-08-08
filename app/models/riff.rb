class Riff < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :audio, presence: true
  has_attached_file :audio
  validates_attachment_content_type :audio, content_type: /\Aaudio\/.*\Z/
end
