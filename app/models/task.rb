class Task < ApplicationRecord
  belongs_to :project

  validates :description, :optimistic, :most_likely, :pessimistic, presence: true
  before_validation :fill_default_values, on: :create

  private

  def fill_default_values
    return if (optimistic.blank? || most_likely.blank? || pessimistic.blank?)

    self.mean ||= ((self.optimistic + 4*self.most_likely + self.pessimistic)/6).floor(2)
    self.standard_deviation ||= ((self.pessimistic - self.optimistic)/6).floor(2)
  end
end
