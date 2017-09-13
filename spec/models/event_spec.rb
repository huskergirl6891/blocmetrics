require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:application) { Application.create!(name: "New Application", url: "https:app.com") }
  let(:event) { Event.create!(name: 'Event name', application: application) }

  describe "attributes" do
    it "has a body attribute" do
      expect(event).to have_attributes(name: "Event name")
    end
  end
end
