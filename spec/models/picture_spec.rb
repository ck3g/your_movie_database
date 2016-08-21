require 'rails_helper'

RSpec.describe Picture, type: :model do
  it "has a valid factory" do
    expect(create :picture).to be_valid
  end

  describe ".associations" do
    it { is_expected.to belong_to :movie }
  end

  describe ".validations" do
    context "when valid" do
      subject { create :picture }
      it { is_expected.to validate_presence_of :movie }
    end
  end
end
