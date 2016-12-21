require "rails_helper"

feature "User tries to sign up" do
  context "leaving fields blank" do
    scenario 'stays on page with error' do
      visit root_path

      click_on "Login or Sign up"

      expect(page).not_to have_content "Login or Sign up"

      click_on "First time here? Sign up"

      expect(current_path).to eq new_user_registration_path

      fill_in :user_email,                 with: "email@email.com"
      fill_in :user_password,              with: "password"
      fill_in :user_password_confirmation, with: "password"

      click_on "Sign up"

      expect(page).to have_content "First name can't be blank"
      expect(page).to have_content "Last name can't be blank"
    end
  end

  context "email already taken" do
    let!(:user) { create :user }
    scenario 'stays on page with error' do
      expect(User.count).to eq 1
      visit root_path

      click_on "Login or Sign up"

      expect(page).not_to have_content "Login or Sign up"

      click_on "First time here? Sign up"

      expect(current_path).to eq new_user_registration_path

      fill_in :user_email,                 with: user.email
      fill_in :user_password,              with: "password"
      fill_in :user_password_confirmation, with: "password"

      click_on "Sign up"

      expect(page).to have_content "Email has already been taken"
      expect(User.count).to eq 1
    end
  end

  context "all fields valid" do
    scenario 'redirected to their home page' do
      expect(User.count).to eq 0
      visit root_path

      click_on "Login or Sign up"

      expect(page).not_to have_content "Login or Sign up"

      click_on "First time here? Sign up"

      expect(current_path).to eq new_user_registration_path

      fill_in :user_email,                 with: "email@email.com"
      fill_in :user_first_name,            with: "Jared"
      fill_in :user_last_name,             with: "Roth"
      fill_in :user_password,              with: "password"
      fill_in :user_password_confirmation, with: "password"

      click_on "Sign up"

      expect(current_path).to eq businesses_path

      expect(User.count).to eq 1

      user = User.first

      expect(user.email).to eq "email@email.com"
      expect(user.first_name).to eq "Jared"
      expect(user.last_name).to eq "Roth"
    end
  end
end
