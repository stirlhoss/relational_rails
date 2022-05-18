class Hole < ApplicationRecord

  belongs_to :course

  validates_presence_of :name,
                        :par,
                        :distance_to_pin

  def self.permanent_holes
    where(permanent: true)
  end

  def self.alpha_sort
    order(:name)
  end
end
