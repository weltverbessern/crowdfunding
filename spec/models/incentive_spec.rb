require 'rails_helper'

describe Incentive do
  it { should have_many :orders }
end
