class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.float :optimistic
      t.float :most_likely
      t.float :pessimistic
      t.float :mean
      t.float :standard_deviation
      t.float :actual
      t.date :started_at
      t.date :ended_at
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
