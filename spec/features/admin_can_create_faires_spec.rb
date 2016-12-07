require "rails_helper"

feature "Admin can create new faires" do
  let(:admin) { create :admin_with_faires }
  scenario 'faires display on their dashboard' do
    create_list :city, 6
    sign_in admin

    expect(admin.faires.count).to eq 1
    visit admin_path

    within("ul.faires li:nth-child(1)") do
      expect(page).to have_content admin.faires[0].city.name
      expect(page).to have_content admin.faires[0].title
    end

    expect(page).not_to have_css "ul.faires li:nth-child(2)"

    click_on "Create New Faire"

    expect(current_path).to eq new_admin_faire_path

    fill_in :faire_title, with: "New Faire"
    fill_in :faire_description, with: "This new faire is super cool"
    select('Vista', from: 'faire[city_id]')

    click_on "Create Faire"

    expect(current_path).to eq admin_path
    expect(admin.faires.count).to eq 2

    within("ul.faires li:nth-child(1)") do
      expect(page).to have_content admin.faires.first.city.name
      expect(page).to have_content admin.faires.first.title
    end

    within("ul.faires li:nth-child(2)") do
      expect(page).to have_content admin.faires.all.last.city.name
      expect(page).to have_content admin.faires.all.last.title
    end

    expect(page).not_to have_css "ul.faires li:nth-child(3)"
  end
end
