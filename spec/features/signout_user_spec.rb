require 'rails_helper'

RSpec.feature "Signout a user" do

	before do
		@srebalaji = User.create(email: "srebalaji@gmail.com", password: "password")
		visit "/"
		click_link "Sign in"
		fill_in "Email", with: "srebalaji@gmail.com"
		fill_in "Password", with: "password"
		click_button "Log in"
	end

	scenario "With valid params" do
		visit "/"
		click_link "Sign out"
		expect(page).to have_content("Signed out successfully.")
		expect(page).not_to have_content("Sign out")
	end
end