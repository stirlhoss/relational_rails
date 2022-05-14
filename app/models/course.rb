class Course < ApplicationRecord
  has_many :holes, dependent: :destroy

  validates_presence_of :name,
                        :permanent,
                        :par,
                        :difficulty

  def self.order_by_recently_created
    order(created_at: :desc)
  end

  def hole_count
    holes.count
  end
end
