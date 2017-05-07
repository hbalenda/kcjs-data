require 'rails_helper'

RSpec.describe Entry, type: :model do
  let(:entry) { Entry.create!(gender: "Female", race: "Asian and Pacific Islander", offense: "burglary", details: "residential", dv: false) }
  describe "attributes" do
    it "has gender, race, offense, details and dv attributes" do
      expect(entry).to have_attributes(gender: "Female", race: "Asian and Pacific Islander", offense: "burglary", details: "residential", dv: false)
    end
  end
end
