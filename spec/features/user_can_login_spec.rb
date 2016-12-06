require "rails_helper"

feature "User tries to log in" do
  context "with correct admin info" do
    let(:admin) { create(:admin_with_events, events_count: 3) }
    scenario 'is redirected to admin dashboard with confirmation' do
      visit new_user_session_path

      fill_in :user_email, with: admin.email
      fill_in :user_password, with: admin.password

      click_on "Log in"

      expect(current_path).to eq admin_path
      expect(page).to have_content "Signed in successfully"
      expect(page).to have_content "Logout"
      expect(page).not_to have_content "Login"
    end
  end

  context "with correct non-admin info" do
    let(:user) { create :user }
    scenario 'is redirected to user dashboard with confirmation' do
      visit new_user_session_path

      fill_in :user_email, with: user.email
      fill_in :user_password, with: user.password

      click_on "Log in"

      expect(page).to have_content "Signed in successfully"
      expect(page).to have_content "Logout"
      expect(page).not_to have_content "Login"
      # As app is built out, build out this section with elements (not/)expected to be found for vendors

    end
  end

  context "with incorrect info" do
    let(:admin) { create :admin }
    scenario 'stays on the page and displays warning' do
      visit new_user_session_path

      fill_in :user_email, with: admin.email
      fill_in :user_password, with: "wrong"

      click_on "Log in"

      expect(current_path).to eq new_user_session_path
      expect(page).to have_content "Invalid Email or password"
      expect(page).not_to have_content "Logout"
    end
  end
end
