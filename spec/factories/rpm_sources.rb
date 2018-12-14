FactoryBot.define do
   factory :rpm_source do
      name { Faker::App.unique.name }
      slug { Faker::Internet.slug }
      path { Dir.mktmpdir(@cached_attributes[:branch_name]) }
      branch { nil }

      transient do
         branch_name { Faker::App.name }
      end

      after(:build) do |o, e|
         o.branch ||= create(:branch, name: e.branch_name)
      end
   end
end
