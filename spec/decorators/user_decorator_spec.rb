require 'rails_helper'

RSpec.describe UserDecorator, type: :decorator do
  before(:each) do
    @user = User.decorate
  end

  context do 'decorated'
    it { expect(@user).to be_decorated }
  end
end
