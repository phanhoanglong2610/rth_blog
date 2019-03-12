FactoryBot.define do
  factory :comment do
    post_id { 1 }
    body { "MyText" }
    user_id { 1 }
  end
end
