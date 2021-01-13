class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :tasks

  enum status: { draft: 0, in_progress: 1, finished: 2 }

  before_validation :fill_default_values, on: :create

  private

  def fill_default_values
    self.status ||= self.class.statuses[:draft]
  end
end
