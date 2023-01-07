class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :todo

  validates :rating, numericality: { greater_than_or_equal_to: -1 }
  validates :rating, numericality: { less_than_or_equal_to: 1 }
  validates :user_id, uniqueness: { scope: :todo_id }

  after_save :recalculate_rating

  def recalculate_rating 
    todo.update(rating: todo.votes.sum(:rating))
  end
end
