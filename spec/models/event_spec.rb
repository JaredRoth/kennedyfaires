require 'rails_helper'

RSpec.describe Event, type: :model do
  context "validations" do
    it { should belong_to :faire }
    it { should have_many :event_spaces }
    it { should have_many :applications }
    it { should have_many(:space_businesses).through(:event_spaces) }
    it { should have_many(:applied_businesses).through(:applications) }
    it { should validate_presence_of :date }
    it { should validate_presence_of :faire }
  end

  context "methods" do
    before do
      user = create(:admin)
      create(:faire_with_events, admin: user)
      @event = Event.first
    end

    it "#title - happy path" do
      expect(@event.title).to eq("Street Faire")
    end

    it "#title - sad path" do
      @event.update(alternate_title: "something cool")
      @event.reload
      expect(@event.title).to eq("something cool")
    end
  end
end
