class Message < ApplicationRecord
  belongs_to :group

  validates :author, presence: true
  validates :content, presence: true
end
