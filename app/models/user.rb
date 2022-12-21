class User < ApplicationRecord
  has_many :todos, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :todo_comments, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,  presence: true, length: { minimum: 4, maximum: 50 }
end
