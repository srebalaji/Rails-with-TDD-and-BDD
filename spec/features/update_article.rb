require 'rails_helper'

RSpec.feature "Updating article" do
	
	before do
		@article = Article.create(title: "New article", description: "New description")
	end

	scenario "Handle a successful updation" do
		visit '/'
		click_link @article.title
		click_link "Edit"

		fill_in "Title", with: "Updated title"
		fill_in "Description", with: "Updated description"

		click_button "Update Article"

		expect(page).to have_content("Article was successfully updated.")
		expect(page.current_path).to eq (article_path(@article))
	end

	scenario "Handle a failure updation" do
		visit '/'
		click_link @article.title
		click_link "Edit"

		fill_in "Title", with: ""
		fill_in "Description", with: "Updated description"

		click_button "Update Article"

		expect(page).to have_content("Some errors prohibited this article from being saved:")
		expect(page.current_path).to eq (article_path(@article))
	end
end