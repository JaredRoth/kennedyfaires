require "rails_helper"

RSpec.describe Admin::FairesController, type: :controller do
  before do
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  it "GET#index" do
    get :index
    expect(response).to render_template(:index)
  end

  it "GET#show" do
    faire = create(:faire, admin: @admin)
    get :show, params: { id: faire.id }
    expect(response).to render_template(:show)
    expect(assigns[:faire]).to eq(faire)
  end

  it "GET#new" do
    get :new
    expect(response).to render_template(:new)
    expect(assigns[:faire]).to be_a_new(Faire)
  end

  it "POST#create" do
    city = create(:city)
    attrs = attributes_for(:faire, admin: @admin).merge(city_id: city.id)
    post :create, params: { faire: attrs }
    expect(response).to redirect_to admin_path
  end

  it "GET#edit" do
    faire = create(:faire, admin: @admin)
    get :edit, params: { id: faire.id }
    expect(response).to render_template(:edit)
    expect(assigns[:faire]).to eq(faire)
  end

  it "PATCH#update" do
    faire = create(:faire, admin: @admin)
    patch :update, params: { id: faire.id, faire: { title: "yup!" } }
    expect(response).to redirect_to admin_path
    expect(assigns[:faire]).to eq(faire)
  end
end
