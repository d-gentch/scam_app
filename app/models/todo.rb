class Todo < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :todo_comments, dependent: :destroy
  
  validates :title, presence: true
end
