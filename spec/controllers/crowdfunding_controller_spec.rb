require 'rails_helper'

describe CrowdfundingController do
  [:index, :checkout].each do |method|
    it "should get #{method}" do
      get method
      expect(response).to be_successful
    end
  end
end