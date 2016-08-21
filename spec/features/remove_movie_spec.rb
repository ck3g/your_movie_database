require 'rails_helper'

feature "Remove movie" do
  given!(:user) { create :user_example_com }
  given!(:movie) { create :movie, user: user }

  scenario "user can remove his own movie from the collection" do
    sign_in_as "user@example.com"
    visit movie_path(movie)

    click_link "Remove"

    expect(page).to have_content "Movie has been removed from your collection"
    expect(Movie.count).to be_zero
  end
end
