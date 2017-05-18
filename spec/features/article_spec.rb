require 'rails_helper'

RSpec.feature "Creating Articles" do
	scenario "User creating articles" do
		visit "/"

		click_link "Create Article"

		fill_in "Title", with: "New Article by rspec"
		fill_in "Description", with: "New Description by rspec"

		click_button "Create Article"

		expect(page).to have_content "Article was successfully created."
		expect(page.current_path).to eq(articles_path)
	end
end