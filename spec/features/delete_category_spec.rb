require "rails_helper"

RSpec.feature "Users can delete categories" do

    scenario "successfully" do
        category = FactoryGirl.create(:category, name: "Desserts")
        visit "/"
        click_link "Desserts"
        click_link "Delete Category"

        expect(page).to have_content "Category was deleted"
        expect(page.current_url).to eq categories_url
        expect(page).to have_no_content "Desserts"

    end

end