class Course < ApplicationRecord

  has_many :holes, dependent: :destroy

  validates_presence_of :name,
                        :permanent,
                        :par,
                        :difficulty

end
