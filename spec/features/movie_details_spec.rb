require 'rails_helper'

feature "Movie details" do
  given!(:user) { create :user_example_com }
  given!(:movie) do
    create :movie,
      user: user,
      title: "Ocean Eleven",
      description: "Movie Description"
  end

  scenario "user can navigate to movie details page" do
    sign_in_as "user@example.com"
    visit dashboard_path

    within "#movie_#{movie.id}" do
      click_link "Ocean Eleven"
    end

    expect(current_path).to eq movie_path(movie)
    expect(page).to have_selector "h1", text: "Ocean Eleven"
    expect(page).to have_content "Movie Description"
  end
end
