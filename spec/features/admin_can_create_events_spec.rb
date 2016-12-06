require "rails_helper"

feature "Admin can create new faires" do
  let(:admin) { create :admin }
  scenario 'faires display on their dashboard' do
    sign_in  admin

    visit admin_path

    click_on "Create New Faire"

    expect(current_path).to eq new_admin_faire_path
  end
end
