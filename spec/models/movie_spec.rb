require 'rails_helper'

RSpec.describe Movie, type: :model do
  it "has a valid factory" do
    expect(create :movie).to be_valid
  end

  describe ".associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many(:pictures).dependent :destroy }
  end

  describe ".validations" do
    context "when valid" do
      subject { create :movie }
      it { is_expected.to validate_presence_of :title }
      it { is_expected.to validate_presence_of :user }
    end
  end
end
