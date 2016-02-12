require 'rails_helper'


include Helpers

describe "Rating" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery }
  let!(:beer2) { FactoryGirl.create :beer, name:"Karhu", brewery:brewery }
  let!(:user) { FactoryGirl.create :user }

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
  end

  it "when given, is registered to the beer and user who is signed in" do
    visit new_rating_path
    select('iso 3', from:'rating[beer_id]')
    fill_in('rating[score]', with:'15')

    expect{
      click_button "Create Rating"
    }.to change{Rating.count}.from(0).to(1)

    expect(user.ratings.count).to eq(1)
    expect(beer1.ratings.count).to eq(1)
    expect(beer1.average_rating).to eq(15.0)
  end
  it "is deleted from db when user deletes it" do
    f1 = FactoryGirl.create(:rating2, beer:beer1)
    f2 = FactoryGirl.create(:rating2, beer:beer2)
    user.ratings << f1
    user.ratings << f2
    visit user.id
    save_and_open_page
    #within(find("#rating")) do
     # click_on("delete")
    #end
    #click_button "Yes"


    #expect(user.ratings.count).to eq(1)
  end

 

end
describe "Ratings" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery }
  let!(:beer2) { FactoryGirl.create :beer, name:"Karhu", brewery:brewery }
  let!(:user) { FactoryGirl.create :user }

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
      user.ratings << FactoryGirl.create(:rating2, beer:beer1)
      user.ratings << FactoryGirl.create(:rating2, beer:beer2)
  end
 it "is shown in list when saved successfully" do
 
    visit ratings_path
   
    expect(page).to have_content 'Number of ratings 2'
  end

end
