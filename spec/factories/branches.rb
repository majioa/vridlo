FactoryBot.define do
   factory :branch do
      name { Faker::App.unique.name }
      slug { Faker::Internet.slug }
      srpms_count { rand }

      transient do
         path_count { 0 }
      end

      after(:create) do |b, e|
         create_list(:branch_path, e.path_count, branch: b)
      end
   end
end
