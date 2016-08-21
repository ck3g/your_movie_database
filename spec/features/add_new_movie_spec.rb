require 'rails_helper'

feature "Add new movie" do
  scenario "user can add movies to his collection" do
    create :user_example_com

    sign_in_as "user@example.com"

    visit dashboard_path
    click_link "Add them Now!"

    within "#new_movie" do
      fill_in "movie_title", with: "Ocean Eleven"
      fill_in "movie_description", with: "Description of Ocean11"
      attach_file "movie_pictures", "#{Rails.root}/spec/fixtures/picture.jpg"
      click_button "Add to Collection"
    end

    expect(page).to have_content "Movie added to collection"
    movie = Movie.last
    expect(movie.title).to eq "Ocean Eleven"
    expect(movie.description).to eq "Description of Ocean11"
    expect(movie.pictures.count).to eq 1
  end
end
