require "rails_helper"

feature "Admin edits existing faires" do
  let(:admin) { create :admin_with_faires }
  let!(:city) { create :city }
  scenario 'appropriate changes are reflected' do
    sign_in admin

    visit admin_path

    this_faire          = admin.faires.first.id
    initial_title       = admin.faires.first.title
    initial_description = admin.faires.first.description
    initial_city        = admin.faires.first.city.name

    within("#faire-#{this_faire}") do
      click_on("Edit Faire")
    end

    expect(current_path).to eq edit_admin_faire_path(this_faire)

    fill_in "faire_title", with: "New Title"
    fill_in "faire_description", with: "New Description"
    select(city.name, from: 'faire[city_id]')

    click_on "Update Faire"

    expect(Faire.find(this_faire).title).to eq "New Title"
    expect(Faire.find(this_faire).description).to eq "New Description"
    expect(Faire.find(this_faire).city.name).to eq city.name

    expect(current_path).to eq admin_path

    within("#faire-#{this_faire}") do
      expect(page).to have_content "New Title"
      expect(page).to have_content city.name

      expect(page).not_to have_content initial_title
      expect(page).not_to have_content initial_city
    end
  end
end
