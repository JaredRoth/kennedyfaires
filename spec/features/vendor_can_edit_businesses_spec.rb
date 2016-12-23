require "rails_helper"

feature "Vendor edits existing businesses" do
  let(:vendor) { create :vendor_with_businesses, businesses_count: 2 }
  context "when they have multiple events" do
    scenario 'they can access the edit page from the list or page' do
      sign_in vendor

      this_business = vendor.businesses.first

      visit businesses_path

      within("#business-#{this_business.id}") do
        click_on "Edit this Business"
      end

      expect(current_path).to eq edit_business_path(this_business.id)

      fill_in :business_business_name,       with: "New Name"
      fill_in :business_product_description, with: "New Product Description"
      fill_in :business_street_address,      with: "New Address"
      fill_in :business_city,                with: "New City"
      fill_in :business_state,               with: "CA"
      fill_in :business_zip,                 with: "99999"

      click_on "Update Business"

      expect(Business.find(this_business.id).business_name).to       eq "New Name"
      expect(Business.find(this_business.id).product_description).to eq "New Product Description"
      expect(Business.find(this_business.id).street_address).to      eq "New Address"
      expect(Business.find(this_business.id).city).to                eq "New City"
      expect(Business.find(this_business.id).state).to               eq "CA"
      expect(Business.find(this_business.id).zip).to                 eq 99999

      expect(current_path).to eq business_path(this_business.id)

      expect(page).not_to have_content this_business.business_name
      expect(page).not_to have_content this_business.product_description
      expect(page).not_to have_content this_business.street_address
      expect(page).not_to have_content this_business.city
      expect(page).not_to have_content this_business.state
      expect(page).not_to have_content this_business.zip

      click_on "View all your Businesses"

      expect(current_path).to eq businesses_path
    end
  end

  context "when they have only one event" do
    let(:vendor) { create :vendor_with_businesses }
    scenario 'they can access the edit page from the business page' do
      sign_in vendor

      this_business = vendor.businesses.first

      visit business_path(this_business.id)

      click_on "Edit this Business"

      expect(current_path).to eq edit_business_path(this_business.id)

      fill_in :business_business_name,       with: "New Name"
      fill_in :business_product_description, with: "New Product Description"
      fill_in :business_street_address,      with: "New Address"
      fill_in :business_city,                with: "New City"
      fill_in :business_state,               with: "CA"
      fill_in :business_zip,                 with: "99999"

      click_on "Update Business"

      expect(Business.find(this_business.id).business_name).to       eq "New Name"
      expect(Business.find(this_business.id).product_description).to eq "New Product Description"
      expect(Business.find(this_business.id).street_address).to      eq "New Address"
      expect(Business.find(this_business.id).city).to                eq "New City"
      expect(Business.find(this_business.id).state).to               eq "CA"
      expect(Business.find(this_business.id).zip).to                 eq 99999

      expect(current_path).to eq business_path(this_business.id)

      expect(page).not_to have_content this_business.business_name
      expect(page).not_to have_content this_business.product_description
      expect(page).not_to have_content this_business.street_address
      expect(page).not_to have_content this_business.city
      expect(page).not_to have_content this_business.state
      expect(page).not_to have_content this_business.zip

      expect(page).not_to have_content "View all your Businesses"
    end
  end
end
