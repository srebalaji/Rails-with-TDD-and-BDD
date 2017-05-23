require 'rails_helper'

RSpec.feature "Show_an_article" do
	
	before do
		@article1 = Article.create(title: "New article", description: "New description")
	end
	
	scenario "show a article in show page" do
		visit "/"
		click_link @article1.title

		expect(page).to have_content @article1.title
		expect(page).to have_content @article1.description
		expect(current_path).to eq(article_path(@article1))
	end

end