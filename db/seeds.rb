# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

project = Project.create(
  name: 'Project1',
  started_at: Date.today
)

project1 = Project.create(
  name: 'Project2',
  started_at: Date.today - 2,
  status: 1
)

project2 = Project.create(
  name: 'Project2',
  started_at: Date.today - 2,
  status: 1
)

task1 = Task.create(
  description: 'This is task #1',
  optimistic: 2,
  most_likely: 5,
  pessimistic: 8,
  started_at: Date.today,
  project_id: project.id
)

# a = Task.create(description: 'This is task #2', optimistic: 1, most_likely: 3, pessimistic: 5, started_at: Date.today, project_id: 3)

task2 = Task.create(
  description: 'This is task #2',
  optimistic: 1,
  most_likely: 3,
  pessimistic: 5,
  started_at: Date.today,
  project_id: project.id
)

task3 = Task.create(
  description: 'This is task #3',
  optimistic: 10,
  most_likely: 11,
  pessimistic: 12,
  started_at: Date.today,
  project_id: project1.id
)

task4 = Task.create(
  description: 'This is task #1',
  optimistic: 2,
  most_likely: 5,
  pessimistic: 8,
  started_at: Date.today,
  project_id: project2.id
)