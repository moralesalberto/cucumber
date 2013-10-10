Given(/^the user goes to the New Message page$/) do
  User.count.should eq(1)
  visit new_user_message_path(User.first) 
end

Then(/^the new message form is presented to them with the notice "(.*?)"$/) do |notice|
  visit new_user_message_path(User.first) #adding this again because we did not capture the notice in the earlier line #adding this again because we did not capture the notice in the earlier line #adding this again because we did not capture the notice in the earlier line 
  page.should have_content(notice)
end

When(/^the User enters message "(.*?)"$/) do |content|
  fill_in('message[content]', :with => content)
end

When(/^the User submits the new message form$/) do
  click_on('Create Message')
end

Then(/^a new message should be created with "(.*?)"$/) do |content|
  User.first.messages.first.content.should eq(content)
end

Then(/^the user should be shown a new page with "(.*?)"$/) do |content|
  page.should have_content(content)
end




