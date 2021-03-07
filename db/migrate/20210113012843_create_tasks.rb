class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.float :optimistic, null: false
      t.float :most_likely, null: false
      t.float :pessimistic, null: false
      t.float :mean
      t.float :standard_deviation
      t.float :actual
      t.date :started_at
      t.date :ended_at
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
