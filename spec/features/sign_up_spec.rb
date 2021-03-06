require 'rails_helper'

feature "Sign Up" do
  scenario "User can sign up providing valid params" do
    visit new_user_registration_path

    within "#new_user" do
      fill_in "user_email", with: "user@example.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      click_button "Sign up"
    end

    expect(page).to have_content "You have signed up successfully"
  end
end
