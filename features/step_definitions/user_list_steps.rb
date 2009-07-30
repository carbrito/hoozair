
Given /^the following users view '(.*)'$/ do |page, table|
  # table is a Cucumber::Ast::Table
  @page = page
  @current_users = table
end

When /^I request users viewing '(.*)'$/ do |page|
   @users = visit "/visitors/#{page}"
end

Then /^the following users are returned$/ do |table|
  # table is a Cucumber::Ast::Table
  @users.should == @current_users
end
