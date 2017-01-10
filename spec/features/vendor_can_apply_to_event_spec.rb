require "rails_helper"

feature "Vendor tries to apply to event" do
  context "with valid information" do
    let(:vendor) { create :vendor_with_businesses }
    let(:admin) { create :admin }
    let(:faire) { create :faire_with_events, events_count: 2, admin: admin }
    scenario 'redirected to that business page with confirmation and mailer' do
      sign_in vendor

      visit city_path(faire.city)
    end
  end

  context "with invalid information" do
    let(:vendor) { create :vendor_with_businesses }
    scenario 'remain on page with warnings' do
      sign_in vendor
    end
  end
end
