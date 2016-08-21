require "rails_helper"

feature "Welcome page" do
  scenario "everyone can see welcome page" do
    visit root_path

    expect(page).to have_content "Your Movie DataBase"
    expect(page).to have_content "Keep your library up to date"
    expect(page).to have_selector "a", text: "Sign Up now!"
  end
end
