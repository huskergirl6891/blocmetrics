require 'rails_helper'

RSpec.describe Application, type: :model do
  let(:application) { Application.create!(name: "Bloc Jams", url: "https://www.blocjams.com") }

 # #2
   describe "attributes" do
     it "has title and body attributes" do
       expect(application).to have_attributes(name: "Bloc Jams", url: "https://www.blocjams.com")
     end
   end
end
