require "rails_helper"

RSpec.feature "Admin logs in" do
  scenario "it should redirect them to their dashboard" do
    expect(Admin.all.count).to eq(0)
    admin = create(:admin)
    expect(Admin.all.count).to eq(1)

    visit root_path

    click_on("Login")

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Successfully Logged In")
    expect(page).to have_content("Logout")
    expect(page).not_to have_content("Login")
    expect(Admin.all.count).to eq(1)
  end
end
