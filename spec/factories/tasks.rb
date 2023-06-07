FactoryBot.define do
  factory :task do
    name {'テストを書く'}
    description {'RSpecとCapybaraとFactoryBotを準備する'}
    user
  end
end