class Hole < ApplicationRecord

  belongs_to :course

  validates_presence_of :name,
                       # :permanent,
                       :par,
                       :distance_to_pin

  def self.permanent_holes
    self.where(permanent: true)
  end
end
