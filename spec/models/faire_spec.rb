require 'rails_helper'

RSpec.describe Faire, type: :model do
  context "validations" do
    it { should belong_to :city }
    it { should belong_to :admin }
    it { should have_many :events }
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :city }
    it { should validate_presence_of :admin }
  end

  context "methods" do
    it "#full_title" do
      user = create(:admin)
      faire = create(:faire, admin: user)

      expect(faire.full_title).to include("Street Faire")
    end
  end

end
