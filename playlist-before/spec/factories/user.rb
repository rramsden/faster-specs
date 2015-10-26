FactoryGirl.define do
  factory :user do
    sequence(:email) { |x|  "user_#{x}@test.com" }
    password 'aB1_cF2sdkj2;sdj!d28@"as4'

    factory :admin do
      admin true
    end
  end
end

