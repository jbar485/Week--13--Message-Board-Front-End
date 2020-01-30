class Group < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :name, presence: true
  validates :genre, presence: true
end
