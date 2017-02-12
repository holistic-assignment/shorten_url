FactoryGirl.define do
  factory(:track) do
    sequence(:ip_address) {Faker::Internet.ip_v4_address}

    sequence(:short_link_id) {ShortLink.ids.sample}
    sequence(:user_id) {User.ids.sample}
    sequence(:created_at) {Faker::Date.between(90.days.ago, Date.today)}
  end
end
