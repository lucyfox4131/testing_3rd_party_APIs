require 'rails_helper'

RSpec.describe SunlightService do
  context "#legislators" do
    it 'returns a list of legislators' do
      VCR.use_cassette("legislators") do
        legislators = SunlightService.new.legislators(gender: "F")
        legislator = legislators.first

        expect(legislators.count).to eq(20)
        expect(legislator[:first_name]).to eq("Joni")
        expect(legislator[:last_name]).to eq("Ernst")
      end
    end
  end
end
