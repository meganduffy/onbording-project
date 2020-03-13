FactoryBot.define do
  factory :user do
    first_name { "Megan" }
    last_name { "Duffy" }
    email { "unique@email.com" }
    password { "password" }
    id { 10 }
  end
end