require 'rails_helper'

feature "Dashboard" do
  scenario "user can navigate to dashboard" do
    create :user_example_com
    sign_in_as "user@example.com"

    visit root_path
    click_link "Go to Dashboard"

    expect(current_path).to eq dashboard_path
    expect(page).to have_content "Dashboard"
  end
end
