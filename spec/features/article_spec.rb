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

	scenario "User created an article without entering body and Description" do 
		visit "/"

		click_link "Create Article"

		fill_in "Title", with: ""
		fill_in "Description", with: ""

		click_button "Create Article"

		expect(page).to have_content "Some errors prohibited this article from being saved:"
		expect(page).to have_content "Title can't be blank"
		expect(page).to have_content "Description can't be blank"
		expect(page.current_path).to eq(articles_path)
	end
end