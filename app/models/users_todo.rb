class UsersTodo < ApplicationRecord
  belongs_to :user
  belongs_to :todo
end
