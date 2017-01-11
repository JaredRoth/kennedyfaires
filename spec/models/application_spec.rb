require 'rails_helper'

RSpec.describe Application, type: :model do
  context "validations" do
    it { should belong_to :business }
    it { should belong_to :event }
  end
end
