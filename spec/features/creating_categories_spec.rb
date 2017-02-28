require "rails_helper"

RSpec.feature "User can create new categories" do
    scenario "with valid attributes" do
        visit "/"

        click_link "New Category"

        fill_in "Name", with: "Desserts"
        fill_in "Description", with: "Everything that is sweet, chocolatey and yummy"
        click_button "Create Category"

        expect(page).to have_content "Category has been created."

        category = Category.find_by(name: "Desserts")
        expect(page.current_url).to eq category_url(category)

        title = "Desserts"
        expect(page).to have_title title



    end

end