require 'rails_helper'

RSpec.feature "Creating Articles" do

	before do
		@article1 = Article.create(title: "Fisrt article", description: "New description fo first")
		@article2 = Article.create(title: "Second article", description: "Second article description")
	end

	scenario "User creating articles" do
		visit '/'

		expect(page).to have_content @article1.title
		expect(page).to have_content @article1.description
		expect(page).to have_content @article2.title
		expect(page).to have_content @article2.description
	end
end