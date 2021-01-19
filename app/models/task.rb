class Task < ApplicationRecord
  belongs_to :project

  validates :description, presence: true
  validates :optimistic, presence: true
  validates :most_likely, presence: true
  validates :pessimistic, presence: true

  after_validation :set_mean
  after_validation :set_standard_deviation

  private

  def set_mean
    self.mean = (optimistic + 4*most_likely + pessimistic)/6
  end

  def set_standard_deviation
    self.standard_deviation = (pessimistic - optimistic)/6
  end
end
