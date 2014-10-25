require 'rails_helper'

RSpec.describe ListsController, :type => :controller do

  include Devise::TestHelpers

  before do
    @user = create(:user)
    sign_in @user
  end

  describe '#create' do
    it "creates a list for the current user" do
      expect( @user.lists.count ).to eq(0)

      @user.lists.create

      expect( @user.lists.count ).to eq(1)
    end
  end
end
