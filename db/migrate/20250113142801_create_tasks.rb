class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.boolean :completed
      t.datetime :completedAt

      t.timestamps
    end
    add_reference :tasks, :user, null: false, foreign_key: true
  end
end
