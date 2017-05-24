require "rails_helper"

RSpec.feature "Deleting article" do

	before do
		@article = Article.create(title: "New article", description: "New description")
	end

	scenario "Handle successful deletion" do
		visit '/'
		click_link @article.title
		click_link "Destroy"

		expect(page).to have_content("Article was successfully destroyed.")
		expect(page.current_path).to eq (articles_path)
	end
end