require 'rails_helper'

feature "Dashboard" do
  scenario "user can visit dashboard" do
    visit root_path

    expect(page).to have_content "Dashboard"
  end
end
