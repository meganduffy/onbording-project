FactoryBot.define do
  factory :user do
    first_name { "Megan" }
    last_name { "Duffy" }
    email { "login@login.com" }
    password { "login" }
    id { "10" }
  end
end