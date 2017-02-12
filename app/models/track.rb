class Track < ApplicationRecord
  belongs_to :short_link
  scope :get_30_day_ago, -> {where(created_at: 30.days.ago..Time.now)}

end
