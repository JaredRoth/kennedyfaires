require "rails_helper"

feature "User tries to log in" do
  context "with correct admin info" do
    let!(:admin) { create :admin_with_faires, faires_count: 3  }
    scenario 'is redirected to admin dashboard with confirmation' do
      visit new_user_session_path

      fill_in :user_email, with: admin.email
      fill_in :user_password, with: admin.password

      click_on "Log in"

      expect(current_path).to eq admin_path
      expect(page).to have_content "Signed in successfully"
      expect(page).to have_content "Logout"
      expect(page).not_to have_content "Login"

      within("ul.faires li:nth-child(1)") do
        expect(page).to have_content admin.faires.first.city.name
        expect(page).to have_content admin.faires.first.title
      end
      within("ul.faires li:nth-child(3)") do
        expect(page).to have_content admin.faires.last.city.name
        expect(page).to have_content admin.faires.last.title
      end

      expect(page).not_to have_css "ul.faires li:nth-child(4)"
    end
    let(:empty_admin) { create :admin }
    scenario "does not have access to other admins' faires" do
      sign_in empty_admin

      expect(Admin.count).to eq 2

      visit admin_path

      within("ul.faires") do
        expect(page).not_to have_css "li"
      end
    end
  end

  context "with correct non-admin info" do
    let(:vendor) { create :vendor }
    scenario 'is redirected to user dashboard with confirmation' do
      visit new_user_session_path

      fill_in :user_email, with: vendor.email
      fill_in :user_password, with: vendor.password

      click_on "Log in"

      expect(page).to have_content "Signed in successfully"
      expect(page).to have_content "Logout"
      # As app is built out, build out this section with elements (not/)expected to be found for vendors

      expect(page).not_to have_content "Login"
    end
  end

  context "with incorrect info" do
    let(:admin) { create :admin  }
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
