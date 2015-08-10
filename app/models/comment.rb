class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :riff
  validates :content, presence: true
end
