require "rails_helper"

feature "Admin edits existing events" do
  let(:admin) { create :admin_with_events, events_count: 2 }
  scenario 'appropriate changes are reflected' do
    sign_in admin

    this_event    = admin.events.first
    initial_year  = this_event.date.year
    initial_title = this_event.title

    expect(this_event.alternate_title).to be_blank

    visit admin_path

    within("ul.faires") do
      click_on("#{this_event.faire.city.name} #{this_event.faire.title}")
    end

    expect(current_path).to eq admin_faire_path(this_event.faire)

    within("#event-#{this_event.id}") do
      click_on "Change Event Date or Title"
    end

    expect(current_path).to eq edit_admin_event_path(this_event)

    fill_in "event_alternate_title", with: "Fall Festival"
    select(initial_year + 1, from: 'event[date(1i)]')

    click_on "Update Event"

    expect(current_path).to eq admin_faire_path(this_event.faire)
    expect(admin.events.find(this_event.id).alternate_title).to eq "Fall Festival"

    within("#event-#{this_event.id}") do
      expect(page).to have_content initial_year + 1
      expect(page).not_to have_content initial_year
      expect(page).to have_content "Fall Festival"
      expect(page).not_to have_content initial_title
    end
  end
end
