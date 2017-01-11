require 'rails_helper'

RSpec.describe Business, type: :model do
  context "validations" do
    it { should belong_to :vendor }
    it { should have_many :business_categories }
    it { should have_many(:categories).through(:business_categories) }
    it { should have_many(:event_spaces) }
    it { should have_many(:applications) }
    it { should have_many(:accepted_events).through(:event_spaces) }
    it { should have_many(:applied_events).through(:applications) }

    # shoulda matchers does support a uniqueness validation with the association yet
    # https://github.com/thoughtbot/shoulda-matchers/issues/814
    # it { should validate_uniqueness_of(:business_name).scoped_to(:vendor) }
    it { should validate_presence_of :business_name }
    it { should validate_presence_of :product_description }
    it { should validate_presence_of :street_address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip }
    it { should validate_presence_of :vendor }

  end
end
