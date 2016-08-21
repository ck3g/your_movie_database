require 'rails_helper'

feature "Dashboard" do
  given!(:user) { create :user_example_com }

  background do
    sign_in_as "user@example.com"
  end

  context "when there is no movies yet" do
    scenario "user can navigate to dashboard" do
      visit root_path
      click_link "Go to Dashboard"

      expect(current_path).to eq dashboard_path
      expect(page).to have_content "You have no Movies yet"
      expect(page).to have_selector "a", text: "Add them Now!"
      expect(page).not_to have_selector "h2", text: "Recently added"
    end
  end

  context "when there is user's movies" do
    given!(:movie) { create :movie, user: user, title: "Ocean Eleven" }

    scenario "user can see movies titles" do
      visit root_path
      click_link "Go to Dashboard"

      expect(page).not_to have_content "You have no Movies yet"
      expect(page).not_to have_selector "a", text: "Add them Now!"
      expect(page).to have_selector "h2", text: "Recently added"
      within "#movie_#{movie.id}" do
        expect(page).to have_content "Ocean Eleven"
      end
    end
  end
end
