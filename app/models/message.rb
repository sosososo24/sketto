class Message < ApplicationRecord

  belongs_to :group
  belongs_to :user, optional: true
  belongs_to :store, optional: true

  validates :content, presence: true, unless: :image?
  
  mount_uploader :image, ImageUploader
end
