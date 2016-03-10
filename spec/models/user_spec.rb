require 'rails_helper'

RSpec.describe User, type: :model do
   context "shoulda" do
      it { expect(subject).to have_db_column(:name).of_type(:string) }
      it { expect(subject).to validate_presence_of(:name) }
   end

   # NOTE: for matchers see https://github.com/rspec/rspec-rails
   context "creates" do
      before do
         @user = build :user
      end

      it { expect(@user).to be_a_new(User) }
      it { expect(@user).to be_valid }
   end

   context "can't create" do
      before do
         @user = build :invalid_user
      end

      it { expect(@user).to_not be_valid }
   end
end
