require 'rails_helper'

RSpec.describe City, type: :model do

  context "validations" do
    it { should have_many :faires }
  end

end
