#frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tasks

  enum status: { draft: 0, in_progress: 1, finished: 2 }

  after_initialize :set_defaults

  validates :name, presence: true, uniqueness: true
  validate :mean_total, :standard_deviation, :actual_duration, on: [:create, :update]

  private

  def set_defaults
    self.status ||= self.class.statuses[:draft]
  end

  def mean_total
    return 0 if tasks.empty?
    self.mean_total = (tasks.pluck(:mean).reduce(:+)).floor(2)
  end

  def standard_deviation
    tasks_standard_deviation = tasks.pluck(:standard_deviation).map do |task_standard_deviation|
      task_standard_deviation**2
    end.reduce(:+).**0.5

    tasks_standard_deviation.floor(2)
  end

  def actual_duration
    self.actual_duration = (ended_at - started_at).floor(0)
  end

  def ended_at
    return Date.today if tasks.pluck(:ended_at).empty?
    tasks.pluck(:ended_at).compact.max
  end

  def started_at
    return 0 if tasks.pluck(:started_at).empty?
    tasks.pluck(:started_at).compact.min
  end

  # TODO
  #   TERMINAR TESTES
end
