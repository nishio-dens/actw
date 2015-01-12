FactoryGirl.define do
  factory :product do
    title 'テスト成果物'
    url 'http://example.com/test'
    user
    published_at Time.current
  end
end
