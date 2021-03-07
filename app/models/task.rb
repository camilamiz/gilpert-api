class Task < ApplicationRecord
  belongs_to :project

  validates :description, :optimistic, :most_likely, :pessimistic, presence: true
  validate :calculate_mean, :calculate_standard_deviation, on: [:create, :update]

  private

  def calculate_mean
    return if (optimistic.blank? || most_likely.blank? || pessimistic.blank?)
    self.mean = ((self.optimistic + 4*self.most_likely + self.pessimistic)/6).floor(2)
  end

  def calculate_standard_deviation
    return if (optimistic.blank? || most_likely.blank? || pessimistic.blank?)
    self.standard_deviation = ((self.pessimistic - self.optimistic)/6).floor(2)
  end
end
