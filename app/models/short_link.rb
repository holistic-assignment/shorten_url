class ShortLink < ApplicationRecord
  before_save :generate_unique_id
  has_many :tracks
  scope :public_link, -> {where link_type:"public_link"}
  scope :user_link, -> {where link_type:"user_link"}
  scope :check_exist_url, ->(url){self.public_link.where(url: url)}

  belongs_to :user, optional: true


  def total_count
    tracks.size
  end

  def url_filter_by_ip
    tracks.group(:ip_address).size.keys.length
  end

  def url_filter_by_user
    tracks.group(:user_id).size.keys.length
  end

  private

  def generate_unique_id
    self.unique_key = SecureRandom.hex(6)
  end

end
