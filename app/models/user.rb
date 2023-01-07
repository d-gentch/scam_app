class User < ApplicationRecord
  has_many :users_todos, dependent: :destroy
  has_many :followed_todos, through: :users_todos, source: :todo
  has_many :todos, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :todo_comments, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,  presence: true, length: { minimum: 4, maximum: 14 }
end
