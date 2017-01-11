require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
    it { should have_many :business_categories }
    it { should have_many(:businesses).through(:business_categories) }
  end
end
