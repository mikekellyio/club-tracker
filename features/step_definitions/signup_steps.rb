When(/^I go to the signup page$/) do
  visit new_user_registration_path
end

When(/^I enter my name as "(.*?)"$/) do |name|
  fill_in "Name", with: name
end

When(/^I enter my email$/) do
  fill_in "Email", with: Faker::Internet.email
end

When(/^I enter my password as "(.*?)"$/) do |password|
  fill_in "user_password", with: password
end

When(/^I enter my password confirmation as "(.*?)"$/) do |password|
  fill_in "Password confirmation", with: password
end

When(/^I submit my registration$/) do
  click_button "Sign up"
end

Then(/^I should have an account with a name of "(.*?)"$/) do |name|
  expect(User.where(name: name).first).to be_present
end