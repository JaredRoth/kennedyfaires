require "rails_helper"

RSpec.describe Admin::EventsController, type: :controller do
  before do
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    @faire = create(:faire, admin: @admin)
  end

  it "GET#new" do
    get :new
    expect(response).to render_template(:new)
  end

  it "POST#create - happy path" do

    attrs = attributes_for(:event, faire_id: @faire.id)
    post :create, params: { event: attrs }
    expect(response).to redirect_to admin_faire_path(@faire)
  end

  it "POST#create - sad path" do
    attrs = attributes_for(:event)
    post :create, params: { event: attrs }
    expect(response).to render_template :new
  end

  it "GET#edit" do
    event = create(:event, faire_id: @faire.id)
    get :edit, params: { id: event.id }
    expect(response).to render_template(:edit)
  end

  it "PATCH#update" do
    event = create(:event, faire_id: @faire.id)
    patch :update, params: { id: event.id, event: { alternate_title: "yup!" } }
    expect(response).to redirect_to admin_faire_path(@faire)
    expect(assigns[:event]).to eq(event)
  end

end
