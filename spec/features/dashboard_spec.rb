require 'rails_helper'

feature "Dashboard" do
  scenario "user can visit dashboard" do
    create :user_example_com
    sign_in_as "user@example.com"

    visit dashboard_path

    expect(page).to have_content "Dashboard"
  end
end
