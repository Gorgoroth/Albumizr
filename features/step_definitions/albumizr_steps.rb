Given /^I am on the signup page$/ do
  visit signup_path
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
