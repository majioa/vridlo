require 'rails_helper'

RSpec.describe Branch, type: :model do
   let(:branch) { create(:branch) }

   context "Database" do
      it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:slug).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:srpms_count).of_type(:integer).with_options(default: 0) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

      it { is_expected.to have_db_index(:name).unique(true) }
      it { is_expected.to have_db_index(:slug).unique(true) }
   end

   context "Associations" do
      it { is_expected.to have_many(:rpm_sources) }
   end

   context "Validations" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:slug) }
   end

   context "Scopes" do
      subject { Branch }

      let(:filled) { create(:branch, srpms_count: 100) }

      it { expect { subject.filled }.to match_array([filled]) }
   end

   context "Questions" do
      let(:perpetual) { create(:branch, id: 0) }
      let(:novel) { build(:branch) }

      it { expect(perpetual).to be_perpetual }
      it { expect(novel).to be_undefined }
   end

   context "Properties" do
      let(:perpetual) { create(:branch) }

      it { expect(perpetual.to_param).to eq(perpetual.slug) }
   end
end
