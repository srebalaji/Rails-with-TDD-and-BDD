require 'rails_helper'

RSpec.feature "Signing a user" do
	before do
		@srebalaji = User.create(email: "srebalaji@gmail.com", password: "password")
	end

	scenario "With valid params" do
		visit "/"
		click_link "Sign in"
		fill_in "Email", with: "srebalaji@gmail.com"
		fill_in "Password", with: "password"
		click_button "Log in"
		expect(page).to have_content("Signed in successfully.")
		expect(page).to have_content("Logged in as #{@srebalaji.email}")
		expect(page).not_to have_content("Sign up")
		expect(page).not_to have_content("Sign in")
	end
end