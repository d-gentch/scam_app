class FeedsController < ApplicationController
  def index
    @feed_todos = current_user.followed_todos
  end
end
