class Todo < ApplicationRecord
  belongs_to :user
  has_many :users_todos, dependent: :destroy
  has_many :users, through: :users_todos, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :todo_comments, dependent: :destroy

  validates :title, presence: true
end
