require "rails_helper"

feature "Sign In" do
  given!(:user) { create :user_example_com }

  scenario "User can sign in using valid credentials" do
   sign_in_as "user@example.com"

    expect(page).to have_content "Signed in successfully"
  end
end
