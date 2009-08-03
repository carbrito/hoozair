
def visit(username, channel)
   put "/visitors/ping", :username => username, :channel => channel
end
Given /^the following users view '(.*)'$/ do |page, table|
  @page = page
  @current_users = table
  table.hashes do |user|
    visit user.name, page
  end
end

When /^I request users viewing '(.*)'$/ do |page|
  # this thing never returns:
  # @users = visit 'me', page
end

Then /^the following users are returned$/ do |table|
  @users.should == @current_users
end
