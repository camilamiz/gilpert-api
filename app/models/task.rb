class Task < ApplicationRecord
  attr_accessor :description, :optimistic, :most_likely, :pessimistic, :mean, :standard_deviation

  belongs_to :project

  validates :description, :optimistic, :most_likely, :pessimistic, presence: true
  before_validation :sets_defaults, on: :create

  private

  def sets_defaults
    if self.optimistic.present? && self.most_likely.present? && self.pessimistic.present?
      self.mean ||= ((self.optimistic + 4*self.most_likely + self.pessimistic)/6).floor(2)
      self.standard_deviation ||= ((self.pessimistic - self.optimistic)/6).floor(2)
    end
  end
end
