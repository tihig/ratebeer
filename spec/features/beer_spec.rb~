require 'rails_helper'


include Helpers

describe "Beer" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:user) { FactoryGirl.create :user }

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "is saved when name is correct" do
    visit new_beer_path
    fill_in('beer[name]', with:'Tumma Lager')

    expect{
      click_button "Create Beer"
    }.to change{Beer.count}.from(0).to(1)

  end
end
