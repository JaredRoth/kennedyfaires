require "rails_helper"

RSpec.feature "Admin logs in" do
  scenario "with correct info" do
    expect(Admin.all.count).to eq 0
    admin = Admin.create(email: "test@test.com", password: "correct")
    expect(Admin.all.count).to eq 1

    visit new_admin_session_path

    fill_in :admin_email, with: "test@test.com"
    fill_in :admin_password, with: "correct"

    click_on "Log in"

    expect(current_path).to eq admin_root_path
    expect(page).to have_content "Signed in successfully"
    expect(page).to have_content "Logout"
    expect(page).not_to have_content "Login"
    expect(Admin.all.count).to eq 1
  end

  scenario "with incorrect info" do
    expect(Admin.all.count).to eq 0
    admin = Admin.create(email: "test@test.com", password: "testtest")
    expect(Admin.all.count).to eq 1

    visit new_admin_session_path

    fill_in :admin_email, with: "test@test.com"
    fill_in :admin_password, with: "wrong"

    click_on "Log in"

    expect(current_path).to eq new_admin_session_path
    expect(page).to have_content "Invalid Email or password"
  end
end
