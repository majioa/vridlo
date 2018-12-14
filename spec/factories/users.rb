FactoryGirl.define do
   factory :user do
      name { FFaker::Name.name }
   end

   factory :invalid_user, class: :User do
      name nil
   end
end
