require 'rails_helper'

feature "Update movie details" do
  given!(:user) { create :user_example_com }
  given!(:movie) { create :movie, user: user }

  scenario "user can update movie details" do
    sign_in_as "user@example.com"
    visit movie_path(movie)
    click_link "Edit"

    within "#edit_movie_#{movie.id}" do
      fill_in "movie_title", with: "Ocean Eleven"
      fill_in "movie_description", with: "Movie Description"
      attach_file "movie_pictures", "#{Rails.root}/spec/fixtures/picture.jpg"
      click_button "Update Movie"
    end

    expect(current_path).to eq movie_path(movie)
    expect(page).to have_content "Movie has been updated"
    movie.reload
    expect(movie.title).to eq "Ocean Eleven"
    expect(movie.description).to eq "Movie Description"
    expect(movie.pictures.count).to eq 1
  end
end
