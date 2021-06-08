#frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :project, optional: true

  validates :description, presence: true
  validate :mean, :standard_deviation, :actual_duration, on: [:create, :update]

  private

  def mean
    return if (optimistic.blank? || most_likely.blank? || pessimistic.blank?)
    self.mean = ((self.optimistic + 4*self.most_likely + self.pessimistic)/6).floor(2)
  end

  def standard_deviation
    return if (optimistic.blank? || most_likely.blank? || pessimistic.blank?)
    self.standard_deviation = ((self.pessimistic - self.optimistic)/6).floor(2)
  end

  def actual_duration
    return 0 if self.started_at.blank?
    self.actual = end_date - self.started_at
  end

  def end_date
    return Date.today if self.ended_at.blank?
    ended_at
  end
end
