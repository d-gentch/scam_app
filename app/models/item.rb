class Item < ApplicationRecord
  belongs_to :todo
  belongs_to :user

  validates :content, presence: true 
end
