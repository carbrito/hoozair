
def ping(username, channel)
   post "/visitors/ping", :username => username, :channel => channel
end

Given /^the following users view '(.*)'$/ do |page, table|
  
  Visitor.delete_all
  @page = page
  @current_users = table

  table.hashes.each do |user|
    ping user[:name], page
  end
end

When /^I request users viewing '(.*)'$/ do |page|
  @users = ping 'me', page
end

Then /^the following users are returned$/ do |table|
   @current_users.hashes.each do |user|
    response.body.should match user[:name]
   end
end
