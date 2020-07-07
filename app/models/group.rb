class Group < ApplicationRecord
  has_many :group_users
  has_many :group_stores
  has_many :users, through: :group_users
  has_many :stores, through: :group_stores
  has_many :messages

  validates :store_ids, presence: true

  def show_last_message
    if (last_message = messages.last).present?
      if last_message.content?
        last_message.content[0, 15]
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません。'
    end
  end

end
