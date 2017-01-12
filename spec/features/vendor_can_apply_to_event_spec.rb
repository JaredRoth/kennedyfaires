require "rails_helper"

feature "Vendor tries to apply to event" do
  context "with valid information" do
    let(:vendor) { create :vendor_with_businesses }
    let(:admin) { create :admin }
    let(:faire) { create :faire_with_events, admin: admin }
    scenario 'redirected to that business page with confirmation and mailer' do
      sign_in vendor

      visit city_path(faire.city.name)

      click_on "Apply for #{faire.events.second.date} show now!"

      expect(current_path).to eq new_event_application_path(faire.events.second)

      # fill in required fields
          # test that each event only has/displays/requires its fields

      # check redirect and display on proper submit

    end
  end

  # test vendor with multiple events in one test?
  # test vendor with existing events? (combine with above?)

  context "with invalid information" do
    let(:vendor) { create :vendor_with_businesses }
    scenario 'remain on page with warnings' do
      sign_in vendor
    end
  end

  context "when not signed in" do
    let(:admin) { create :admin }
    let(:faire) { create :faire_with_events, admin: admin }
    scenario 'is instructed to sign in' do
      visit city_path(faire.city.name)

      expect(page).to have_content "Please register or sign in to apply to events"
      expect(page).to_not have_content "Apply for #{faire.events.first.date} show now!"
      expect(page).to_not have_content "Apply for #{faire.events.second.date} show now!"
    end
  end
end
