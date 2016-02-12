require 'rails_helper'

RSpec.describe Beer, type: :model do
  describe "with a proper name and style" do
   let(:beer){ Beer.create name:"Budweiser", style:"Lager"}

   it "is saved" do
      expect(beer).to be_valid
      expect(Beer.count).to eq(1)
   end
  end

  describe "is not saved" do

    it "if it has no name" do
      beer = Beer.new style:"Lager" 

      expect(Beer.count).to eq(0)
    end

    it "if it has no style" do
      beer = Beer.new name:"Budweiser" 

      expect(Beer.count).to eq(0)
    end
  end




end

