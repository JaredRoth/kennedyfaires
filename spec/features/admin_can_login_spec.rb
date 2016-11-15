require "rails_helper"

feature "Admin tries to log in" do
  let!(:admin) { create(:admin_with_events, events_count: 3) }
  context "with correct info" do
    scenario 'is redirected to dashboard with confirmation' do
      visit new_admin_session_path

      fill_in :admin_email, with: "admin@example.com"
      fill_in :admin_password, with: "correct_password"

      click_on "Log in"
      expect(current_path).to eq admin_root_path
      expect(page).to have_content "Signed in successfully"
      expect(page).to have_content "Logout"
      expect(page).not_to have_content "Login"
    end
  end

  context "with incorrect info" do
    scenario 'stays on the page and displays warning' do
      visit new_admin_session_path

      fill_in :admin_email, with: "admin@example.com"
      fill_in :admin_password, with: "wrong"

      click_on "Log in"

      expect(current_path).to eq new_admin_session_path
      expect(page).to have_content "Invalid Email or password"
      expect(page).not_to have_content "Logout"
    end
  end
end
