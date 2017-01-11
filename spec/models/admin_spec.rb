require 'rails_helper'

RSpec.describe Admin, type: :model do
  context "validations" do
    it { should have_many :faires }
    it { should have_many :events }
  end
end
