FactoryGirl.define do
  factory(:short_link) do
    link_type "user_link"
    sequence(:unique_key) {SecureRandom.hex(6)}
    url "http://www.google.com"
    sequence(:user_id) {User.ids.sample}
  end
end
