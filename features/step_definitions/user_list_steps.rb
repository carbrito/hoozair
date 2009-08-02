
Given /^the following users view '(.*)'$/ do |page, table|
  @page = page
  @current_users = table
  table.hashes do |user|
    put "/visitors/ping", :username => user.name, :channel => page
  end
end

When /^I request users viewing '(.*)'$/ do |page|
   @users = visit "/visitors/#{page}"
end

Then /^the following users are returned$/ do |table|
  @users.should == @current_users
end
