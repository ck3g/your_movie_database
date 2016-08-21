require 'rails_helper'

feature "Remove picture" do
  given!(:user) { create :user_example_com }
  given!(:movie) { create :movie, user: user }
  given!(:picture) { create :picture, movie: movie }

  scenario "user can delete picture from the movie" do
    sign_in_as "user@example.com"
    visit edit_movie_path(movie)

    within "#picture_#{picture.id}" do
      click_link "Remove"
    end

    expect(movie.pictures.count).to be_zero
  end
end
