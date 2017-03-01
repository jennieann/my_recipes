require "rails_helper"

RSpec.feature "Users can view categories" do

    scenario "with the project details" do
        category = FactoryGirl.create(:category, name: "Desserts", description: "Yammy stuff sweet sweet")

        visit "/"

        expect(page).to have_content("Yammy stuff sweet sweet")

        click_link "Desserts"


        expect(page.current_url).to eq category_url(category)

    end

end
