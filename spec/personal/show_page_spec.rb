require "rails_helper"

RSpec.describe "Welcome Page" do
  before :each do
    @user = User.create!(name: "Madeleine")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit("/users/#{@user.id}/edit")

    fill_in :birthday, with: "1990-05-29"

    click_on "CONTINUE"

  end

  it "should have landing page, log in link and todays neos" do
    @user.harbingers.first.name = "ooga booga"
    @user.harbingers.first.update!(name)

    visit "/personal"
    expect(page).to have_content("Personal Zodiac")
    expect(page).to have_content("LOG IN")
    expect(page).to have_content("HOME")
    expect(page).to have_content("Track your Harbinger of Doom")
    expect(page).to have_css(".cathulu")
    # cathulu = find(:css, ".cathulu")
    # expect(cathulu).not_to be_empty
    # expect(page).to have_content("project statement and intent")
  end
end
