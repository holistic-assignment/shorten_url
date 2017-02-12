FactoryGirl.define do
  factory(:user) do
    email "test@gmail.com"
    ip nil
    password_digest "ToFactory: RubyParser exception parsing this attribute"
    username "test"
  end
end
