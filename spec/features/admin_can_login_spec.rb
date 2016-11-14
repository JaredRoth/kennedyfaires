require "rails_helper"

feature "Admin logs in" do
  let!(:admin) { Admin.create(email: "test@test.com", password: "correct") }
  context "with correct info" do
    it 'redirects to dashboard and displays confirmation' do
      visit new_admin_session_path

      fill_in :admin_email, with: "test@test.com"
      fill_in :admin_password, with: "correct"

      click_on "Log in"

      expect(current_path).to eq admin_root_path
      expect(page).to have_content "Signed in successfully"
      expect(page).to have_content "Logout"
      expect(page).not_to have_content "Login"
    end
  end

  context "with incorrect info" do
    it 'stays on the page and displays warning' do
      visit new_admin_session_path

      fill_in :admin_email, with: "test@test.com"
      fill_in :admin_password, with: "wrong"

      click_on "Log in"

      expect(current_path).to eq new_admin_session_path
      expect(page).to have_content "Invalid Email or password"
      expect(page).not_to have_content "Logout"
    end
  end
end
