class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :status, null: false, default: 0
      t.float :mean_total
      t.float :standard_deviation
      t.float :actual_duration
      t.date :started_at
      t.date :ended_at

      t.timestamps
    end
  end
end
