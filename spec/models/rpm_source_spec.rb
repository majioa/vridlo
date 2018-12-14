require 'rails_helper'

RSpec.describe RpmSource, type: :model do
   let(:rpm_source) { create(:rpm_source, branch: branch) }
   let(:branch) { create(:branch) }

   context "Database" do
      it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:slug).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:path).of_type(:string).with_options(null: false) }
      it { is_expected.to have_db_column(:branch_id).of_type(:integer).with_options(null: false, foreign_key: true) }
      it { is_expected.to have_db_column(:primary).of_type(:boolean).with_options(default: false, null: false) }
      it { is_expected.to have_db_column(:active).of_type(:boolean).with_options(default: true, null: false) }
      it { is_expected.to have_db_column(:published).of_type(:boolean).with_options(default: true, null: false) }
      it { is_expected.to have_db_column(:rpms_count).of_type(:integer).with_options(default: 0, null: false) }
      it { is_expected.to have_db_column(:changed_at).of_type(:datetime).with_options(null: false, default: "1970-01-01 00:00:00 UTC") }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }

      it { is_expected.to have_db_index(:name).unique(true) }
      it { is_expected.to have_db_index(:slug).unique(true) }
      it { is_expected.to have_db_index(:path).unique(true) }
      it { is_expected.to have_db_index(:branch_id) }
   end

   context "Associations" do
      it { is_expected.to belong_to(:branch) }
   end

   context "Validations" do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:slug) }
      it { is_expected.to validate_presence_of(:path) }
      it { is_expected.to validate_presence_of(:branch) }
      # TODO add custom validation
   end

   context "Scopes" do
      subject { RpmSource }

      let(:active) { create(:rpm_source, active: true) }
      let(:primary) { create(:rpm_source, primary: true) }
      let(:published) { create(:rpm_source, published: true) }
      let(:for_branch) { |_, b| create(:rpm_source, branch: b) }

      it { expect{ subject.active }.to match_array([active]) }
      it { expect{ subject.primary }.to match_array([primary]) }
      it { expect{ subject.published }.to match_array([published]) }
      it { expect{ subject.for_branch(branch) }.to match_array([for_branch(branch)]) }
   end

   context "Questions" do
      let(:empty) { create(:rpm_source, rpms_count: 0) }

      it { expect(empty).to be_empty }
   end
end
