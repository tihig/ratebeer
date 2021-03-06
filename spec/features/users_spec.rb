require 'rails_helper'

include Helpers

describe "User" do
  before :each do
    FactoryGirl.create :user
  end

  describe "who has signed up" do
    it "can signin with right credentials" do
      sign_in(username:"Pekka", password:"Foobar1")

      expect(page).to have_content 'Welcome back!'
      expect(page).to have_content 'Pekka'
    end

    it "is redirected back to signin form if wrong credentials given" do
      sign_in(username:"Pekka", password:"wrong")

      expect(current_path).to eq(signin_path)
      expect(page).to have_content 'Username and/or password mismatch'
    end
  end

  it "when signed up with good credentials, is added to the system" do
    visit signup_path
    fill_in('user_username', with:'Brian')
    fill_in('user_password', with:'Secret55')
    fill_in('user_password_confirmation', with:'Secret55')

    expect{
      click_button('Create User')
    }.to change{User.count}.by(1)
  end
end

 describe "who has signed in" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:brewery2) { FactoryGirl.create :brewery, name:"Olvi" }
  let!(:style) { FactoryGirl.create :style}
  let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery, style:style }
  let!(:beer2) { FactoryGirl.create :beer, name:"Karhu", brewery:brewery, style:style }
  let!(:beer3) { FactoryGirl.create :beer, name:"Olvin kolmonen", brewery:brewery2, style:style }
  let!(:user) {FactoryGirl.create :user }

  before :each do
    sign_in(username:"Pekka", password:"Foobar1")
      user.ratings << FactoryGirl.create(:rating2, beer:beer1)
      user.ratings << FactoryGirl.create(:rating2, beer:beer3)
      user.ratings << FactoryGirl.create(:rating3, beer:beer2)
  end

   it "has favorite style" do
    page.first(:link, "Pekka").click
    save_and_open_page
    expect(page).to have_content 'Favorite style is Lager'
  end

   it "has favorite brewery" do
    page.first(:link, "Pekka").click
    expect(page).to have_content 'Favorite brewery is Koff'
  end

 end


