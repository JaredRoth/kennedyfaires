require 'rails_helper'

RSpec.describe Vendor, type: :model do
  context "validations" do
    it { should have_many :businesses }
  end
end
