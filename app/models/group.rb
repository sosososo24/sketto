class Group < ApplicationRecord
  has_many :group_users
  has_many :group_stores
  has_many :users, through: :group_users
  has_many :stores, through: :group_stores

  validates :name, presence: true
  validates :store_ids, presence: true

end
