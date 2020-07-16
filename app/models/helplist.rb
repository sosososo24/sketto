class Helplist < ApplicationRecord
  belongs_to :store
  def self.search(search)
    return Helplists.all unless search
    Helplist.where(['date LIKE ?', "%#{search}%"])
  end
end
