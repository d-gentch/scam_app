class TodoComment < ApplicationRecord
  belongs_to :user
  belongs_to :todo

  validates_presence_of [:body]
end
