require "rails_helper"

feature "Vendor tries to create business" do
  context "they have none yet" do
    let(:vendor) { create :vendor }
    scenario 'redirected to that business landing page' do
      create :vendor_with_businesses
      expect(vendor.businesses.empty?).to eq true

      sign_in vendor

      visit businesses_path

      click_on "Register a Business to continue"

      expect(current_path).to eq new_business_path

      fill_in :business_business_name,       with: Business.first.business_name
      fill_in :business_product_description, with: "Product Description"
      fill_in :business_street_address,      with: "123 Main Street"
      fill_in :business_city,                with: "Anytown"
      fill_in :business_state,               with: "CA"
      fill_in :business_zip,                 with: "12345"

      click_on "Register this Business"

      expect(vendor.businesses.count).to eq 1
      expect(vendor.businesses.first.business_name).to eq Business.first.business_name
      expect(vendor.businesses.first.product_description).to eq "Product Description"
      expect(vendor.businesses.first.street_address).to eq "123 Main Street"
      expect(vendor.businesses.first.city).to eq "Anytown"
      expect(vendor.businesses.first.state).to eq "CA"
      expect(vendor.businesses.first.zip).to eq 12345

      expect(current_path).to eq business_path(vendor.businesses.first)

      # Eventually create this page and all associated info
    end
  end

  context "they have at least one existing business" do
    let(:vendor) { create :vendor_with_businesses }
    scenario 'redirected to businesses landing page' do
      expect(vendor.businesses.count).to eq 1

      sign_in vendor

      visit business_path(vendor.businesses.first)

      click_on "Add Another Here"

      expect(current_path).to eq new_business_path

      fill_in :business_business_name,       with: "Business Name"
      fill_in :business_product_description, with: "Product Description"
      fill_in :business_street_address,      with: "123 Main Street"
      fill_in :business_city,                with: "Anytown"
      fill_in :business_state,               with: "CA"
      fill_in :business_zip,                 with: "12345"

      click_on "Register this Business"

      expect(vendor.businesses.count).to eq 2
      expect(vendor.businesses.last.business_name).to eq "Business Name"
      expect(vendor.businesses.last.product_description).to eq "Product Description"
      expect(vendor.businesses.last.street_address).to eq "123 Main Street"
      expect(vendor.businesses.last.city).to eq "Anytown"
      expect(vendor.businesses.last.state).to eq "CA"
      expect(vendor.businesses.last.zip).to eq 12345

      expect(current_path).to eq businesses_path

      within("ul.businesses li:nth-child(1)") do
        expect(page).to have_content vendor.businesses.first.business_name
      end

      within("ul.businesses li:nth-child(2)") do
        expect(page).to have_content "Business Name"
      end
    end
  end

  context "with missing information" do
    let(:vendor) { create :vendor }
    scenario 'stay on page with errors' do
      sign_in vendor

      visit businesses_path

      click_on "Register a Business to continue"

      expect(current_path).to eq new_business_path

      fill_in :business_business_name,       with: "Business Name"
      fill_in :business_product_description, with: "Product Description"
      fill_in :business_street_address,      with: "123 Main Street"
      fill_in :business_state,               with: "CA"
      fill_in :business_zip,                 with: "12345"

      click_on "Register this Business"

      expect(vendor.businesses.count).to eq 0

      expect(page).to have_content "City can't be blank"
    end
  end

  context "that already exists" do
    let(:vendor) { create :vendor_with_businesses }
    scenario 'stay on page with errors' do
      sign_in vendor

      visit business_path(vendor.businesses.first)

      click_on "Add Another Here"

      expect(current_path).to eq new_business_path

      fill_in :business_business_name,       with: vendor.businesses.first.business_name
      fill_in :business_product_description, with: "Product Description"
      fill_in :business_street_address,      with: "123 Main Street"
      fill_in :business_city,                with: "Anytown"
      fill_in :business_state,               with: "CA"
      fill_in :business_zip,                 with: "12345"

      click_on "Register this Business"

      expect(page).to have_content "Business name has already been taken"
    end
  end
end
