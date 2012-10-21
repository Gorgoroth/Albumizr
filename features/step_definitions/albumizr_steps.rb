Given /^I am on the signup page$/ do
  visit signup_path
end

Given /^I am on the signin page$/ do
  visit signin_path
end


When /^I submit invalid "(.*?)" and\/or "(.*?)" and "(.*?)"$/ do |username, password, confirmation|
  fill_in "Username", with: username
  fill_in "Password", with: password
  fill_in "Password confirmation", with: confirmation
  click_button "Sign up"
end

Then /^I should see an error message$/ do
  page.should have_selector('div.alert.alert-error')
end

Then /^I should see the signup form$/ do
  page.should have_content('Create an account for Albumizr')
end

When /^I submit valid signup information$/ do
  fill_in "Username", with: "user"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button "Sign up"
end

Then /^I should get logged in$/ do
  page.should have_link('Sign out', href: signout_path)
end

When /^I submit invalid signin information$/ do
  click_button "Sign in"
end

Then /^I should see the signin form$/ do
  page.should have_content('Log in to Albumizr')
end

Given /^I am a registered user$/ do
  @user = User.create(name: "user", password: "password", password_confirmation: "password")
end

When /^I submit valid signin information$/ do
  fill_in "Username", with: "user"
  fill_in "Password", with: "password"
  click_button "Sign in"
end

Then /^I should see a signup success message$/ do
  page.should have_content('Welcome to Albumizr!')
end

Given /^I am currently logged in$/ do
  @user = User.create(name: "user", password: "password", password_confirmation: "password")
  visit signin_path
  fill_in "Username", with: "user"
  fill_in "Password", with: "password"
  click_button "Sign in"
end

When /^I signout$/ do
  click_link "Sign out"
end

Then /^I should not be signed in$/ do
  page.should_not have_link('Sign out', href: signout_path)
end

Then /^I should see a goodbye message$/ do
  page.should have_content('We will miss you here at Albumizr!')
end


