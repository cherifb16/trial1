FactoryBot.define do
  factory :task do
    title { 'test_title' }
    content { 'test_content' }
    expired_at { '2021-03-03 03:33:33' }
    status { 1 }
    priority { 1 }
  end
end
