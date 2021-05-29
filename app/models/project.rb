#frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tasks

  enum status: { draft: 0, in_progress: 1, finished: 2 }

  after_initialize :set_defaults

  validates :name, presence: true, uniqueness: true
  validate :calculate_mean_total, on: [:create, :update]

  private

  def set_defaults
    self.status ||= self.class.statuses[:draft]
  end

  def calculate_mean_total
    return 0 if tasks.empty?
    self.mean = (tasks.pluck(:mean).reduce(:+)).floor(2)
  end

  # def calculate_standard_deviation
  #   return if (optimistic.blank? || most_likely.blank? || pessimistic.blank?)
  #   self.standard_deviation = ((self.pessimistic - self.optimistic)/6).floor(2)
  # end

  #TODO
  #adicionar migration para colocar default 0 nas estimativas de tasks
  # arrumar testes
end
