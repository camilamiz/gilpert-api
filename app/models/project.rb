#frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tasks

  enum status: { draft: 0, in_progress: 1, finished: 2 }

  before_validation :fill_default_values, on: :create

  validates :name, presence: true, uniqueness: true
  validate :mean_total

  private

  def fill_default_values
    self.status ||= self.class.statuses[:draft]
  end
end
