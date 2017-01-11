require 'rails_helper'

RSpec.describe BusinessCategory, type: :model do
  context "validations" do
    it { should belong_to :business }
    it { should belong_to :category }
  end
end
