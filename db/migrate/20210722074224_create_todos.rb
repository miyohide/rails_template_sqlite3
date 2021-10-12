class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :title, limit: 100, null: false
      t.text :body, limit: 500, null: false

      t.timestamps
    end
  end
end
