class Hole < ApplicationRecord

  belongs_to :course

  validates_presence_of :name,
                       :permanent,
                       :par,
                       :distance_to_pin
end
