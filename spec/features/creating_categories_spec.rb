require "rails_helper"

RSpec.feature "User can create new categories" do
    scenario "with valid attributes" do
        visit "/"

        click_link "New Category"

        fill_in "Name", with: "Desserts"
        fill_in "Description", with: "Everything that is sweet, chocolatey and yummy"
        click_button "Create Category"

        expect(page).to have_content "Category has been created."

    end

end