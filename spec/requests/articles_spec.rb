require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET /articles" do
    it "works! (now write some real specs)" do
      get articles_path
      expect(response).to have_http_status(200)
    end
  end

  before do 
  	@article = Article.create(title: "First article", description: "New description")
  end

  describe "GET /articles" do
  	context "With existing article" do
  		before { get "/articles/#{@article.id}"}
  		it "handles existing article" do
  			expect(response.status).to eq 200
  		end
  	end

  	context "With non existing article" do
  		before { get "/articles/xxxxx" }
  		it "handles a non existing article" do
  			expect(response.status).to eq 302
  			flash_message = "Article not found dude..!!"
  			expect(flash[:alert]).to eq flash_message
  		end
  	end
  end
end
