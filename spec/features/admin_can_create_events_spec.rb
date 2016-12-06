require "rails_helper"

feature "Admin can create new events" do
  let(:admin) { create :admin }
  scenario 'events display on their dashboard' do
    sign_in  admin

    visit admin_path

    click_on "Create New Event"

    expect(current_path).to eq new_admin_event_path
  end
end
