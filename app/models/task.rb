class Task < ApplicationRecord
  attr_accessor :description, :optimistic, :most_likely, :pessimistic
  attr_reader :mean, :standard_deviation

  belongs_to :project

  after_initialize :set_defaults

  validates :description, :optimistic, :most_likely, :pessimistic, presence: true

  private

  def set_defaults
    self.mean ||= ((self.optimistic + 4*self.most_likely + self.pessimistic)/6).floor(2)
    self.standard_deviation ||= ((self.pessimistic - self.optimistic)/6).floor(2)
  end
end
