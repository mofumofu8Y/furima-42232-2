FactoryBot.define do
  factory :order do
    item { nil }
    user { nil }
    status { "MyString" }
  end
end
