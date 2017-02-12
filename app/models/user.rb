class User < ApplicationRecord
  has_many :short_links
  has_secure_password
end
