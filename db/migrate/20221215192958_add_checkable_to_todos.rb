class AddCheckableToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :checkable, :boolean, default: false, null: false
  end
end
