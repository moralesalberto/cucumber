
When(/^the User goes to the New Message page$/) do
  User.count.should eq(1)
  visit new_user_message_path(User.first)
end

Then(/^the new message form is presented to them with the notice "([^"]*)"$/) do |notice|
  User.count.should eq(1)
  visit new_user_message_path(User.first)
  page.should have_content(notice)
end

When(/^the User enters message "(.*?)"$/) do |content|
  User.count.should eq(1)
  visit new_user_message_path(User.first) 
  fill_in('message[content]', :with => content)
end

When(/^the User submits the message form with "(.*?)"$/) do |content|
  User.count.should eq(1)
  visit new_user_message_path(User.first) 
  fill_in('message[content]', :with => content)
  click_on('Create Message')
end

Then(/^the message should be created with "(.*?)"$/) do |content|
  User.count.should eq(1)
  visit new_user_message_path(User.first) 
  fill_in('message[content]', :with => content)
  click_on('Create Message')
  User.first.messages.first.content.should eq(content)
end

Then(/^the user should see the new message "(.*?)"$/) do |content|
  User.count.should eq(1)
  visit new_user_message_path(User.first) 
  fill_in('message[content]', :with => content)
  click_on('Create Message')
  page.should have_content(content)
end




