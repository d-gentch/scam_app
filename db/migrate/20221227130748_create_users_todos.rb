class CreateUsersTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :users_todos do |t|
      t.references :todo, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
