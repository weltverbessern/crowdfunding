require 'rails_helper'

describe PaymentOption do
  it { should have_many :orders }
end
