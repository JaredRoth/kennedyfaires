require "rails_helper"

feature "Vendor tries to create business" do
  context "they have none yet" do
    scenario 'redirected to that business landing page' do

    end
  end

  context "they have at least one existing business" do
    scenario 'redirected to vendor landing page' do

    end
  end

  context "with missing information" do
    scenario 'stay on page with errors' do

    end
  end

  context "that already exists" do
    scenario 'stay on page with errors' do

    end
  end
end
