require "rails_helper"

RSpec.feature "Users can edit categories" do

    before do
        FactoryGirl.create(:category, name: "Desserts")

        visit "/"
        click_link "Desserts"
        click_link "Edit Category"
    end

    scenario "with valid attributes" do

        fill_in "Name", with: "Desserts and sweets"

        click_button "Update Category"

        expect(page).to have_content "Category was updated."
        expect(page).to have_content "Desserts and sweets"

    end

    scenario "when providing invalid attributes" do
        fill_in "Name", with: ""
        click_button "Update Category"

        expect(page).to have_content "Category was not updated."
        
    end

end