require "rails_helper"

feature "Admin can create new events" do
  let(:admin) { create :admin_with_faires }
  scenario 'events display on their dashboard' do

    sign_in admin

    expect(admin.faires.first.events.count).to eq 0

    visit admin_path

    click_on "Add New Event"

    expect(current_path).to eq new_admin_event_path

    select("#{admin.faires.first.city.name} #{admin.faires.first.title}", from: 'event[faire_id]')
    select('2016', from: 'event[date(1i)]')
    select('May', from: 'event[date(2i)]')
    select('15', from: 'event[date(3i)]')

    click_on "Add This Event"

    expect(current_path).to eq admin_faire_path(admin.faires.first)
    expect(admin.faires.first.events.count).to eq 1
  end
end
