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

  # def mean_total
  #   if self.mean_total.nil? && (self.status == 'in_progress' || self.status == 'finished')
  #     errors.add(:mean_total, 'must not be nil when status is in_progress or finished')
  #   end
  # end
end
