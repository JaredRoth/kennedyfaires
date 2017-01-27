require "rails_helper"

RSpec.describe BusinessesController, type: :controller do
  before do
    @user = create(:vendor)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "GET#index" do
    get :index
    expect(response).to render_template(:index)
  end

  it "GET#show" do
    b = create(:business, vendor: @user)
    get :show, params: { id: b.id }
    expect(response).to render_template(:show)
    expect(assigns[:business]).to eq(b)
  end

  it "GET#new" do
    get :new
    expect(response).to render_template(:new)
  end

  it "POST#create - happy path" do
    attrs = attributes_for(:business, vendor: @user)
    post :create, params: { business: attrs }
    expect(response).to redirect_to business_path(Business.last.id)
  end

  it "POST#create - sad path" do
    attrs = attributes_for(:business, vendor: @user)
    attrs.delete(:business_name)
    post :create, params: { business: attrs }
    expect(response).to render_template(:new)
  end

  it "GET#edit" do
    b = create(:business, vendor: @user)
    get :edit, params: { id: b.id }
    expect(response).to render_template(:edit)
    expect(assigns[:business]).to eq(b)
  end

  it "PATCH#update" do
    b = create(:business, vendor: @user)
    patch :update, params: { id: b.id, business: { business_name: "MARK!" } }
    expect(response).to redirect_to(business_path(b.id))
  end
end
