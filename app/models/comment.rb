class Comment < ApplicationRecord
  belongs_to :gossip
  belongs_to :user

  validates :text, presence: true
end
