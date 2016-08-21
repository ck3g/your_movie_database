require 'rails_helper'

feature "List of the movies" do
  given!(:user) { create :user_example_com }
  given!(:user_movie) { create :movie, user: user, title: "Ocean Eleven" }
  given!(:movie) { create :movie, title: "The Big Lebowski" }

  scenario "user can navigate to list of his own movies" do
    sign_in_as "user@example.com"
    visit dashboard_path
    within "nav.navbar" do
      click_link "Movies"
    end

    expect(current_path).to eq movies_path
    expect(page).to have_selector "h1", text: "Your movie collection"
    expect(page).to have_content "Ocean Eleven"
    expect(page).not_to have_content "The Big Lebowski"
  end
end
