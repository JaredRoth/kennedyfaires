require "rails_helper"

feature "Vendor edits existing businesses" do
  context "when they have multiple events" do
    let(:vendor) { create :vendor_with_businesses, businesses_count: 2 }
    let(:business)        { vendor.businesses.first }
    let(:new_name)        { "New " + business.business_name }
    let(:new_description) { "New " + business.product_description }
    let(:new_address)     { "New " + business.street_address }
    let(:new_city)        { "New " + business.city }
    let(:new_state)       { "CA" }
    let(:new_zip)         { 99999 }
    scenario 'they can access the edit page from the list or page' do
      sign_in vendor

      visit businesses_path

      within("#business-#{business.id}") do
        click_on "Edit this Business"
      end

      expect(current_path).to eq edit_business_path(business.id)

      fill_in :business_business_name,       with: new_name
      fill_in :business_product_description, with: new_description
      fill_in :business_street_address,      with: new_address
      fill_in :business_city,                with: new_city
      fill_in :business_state,               with: new_state
      fill_in :business_zip,                 with: new_zip

      click_on "Update Business"

      expect(current_path).to eq business_path(business.id)

      expect(page).to have_content new_name
      expect(page).to have_content new_description
      expect(page).to have_content new_address
      expect(page).to have_content new_city
      expect(page).to have_content new_state
      expect(page).to have_content new_zip

      click_on "View all your Businesses"

      expect(current_path).to eq businesses_path
    end
  end

  context "when they have only one event" do
    let(:vendor) { create :vendor_with_businesses }
    let(:business)        { vendor.businesses.first }
    let(:new_name)        { "New " + business.business_name }
    let(:new_description) { "New " + business.product_description }
    let(:new_address)     { "New " + business.street_address }
    let(:new_city)        { "New " + business.city }
    let(:new_state)       { "CA" }
    let(:new_zip)         { 99999 }
    scenario 'they can access the edit page from the business page' do
      sign_in vendor

      visit business_path(business.id)

      click_on "Edit this Business"

      expect(current_path).to eq edit_business_path(business.id)

      fill_in :business_business_name,       with: new_name
      fill_in :business_product_description, with: new_description
      fill_in :business_street_address,      with: new_address
      fill_in :business_city,                with: new_city
      fill_in :business_state,               with: new_state
      fill_in :business_zip,                 with: new_zip

      click_on "Update Business"

      expect(current_path).to eq business_path(business.id)

      expect(page).to have_content new_name
      expect(page).to have_content new_description
      expect(page).to have_content new_address
      expect(page).to have_content new_city
      expect(page).to have_content new_state
      expect(page).to have_content new_zip

      expect(page).not_to have_content "View all your Businesses"
    end
  end
end
