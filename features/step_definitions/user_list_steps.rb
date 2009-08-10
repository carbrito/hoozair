
def ping(username, channel)
   post "/visitors/ping", :username => username, :channel => channel
end

Given /^the following users view '(.*)'$/ do |page, table|
  @page = page
  @current_users = table

  table.hashes.each do |user|
    ping user[:name], page
  end
end

When /^I request users viewing '(.*)'$/ do |page|
  puts "doin' the request"
  @users = ping 'me', page
  puts @users.inspect
  puts @users -1  # gah, why is this 200
end

Then /^the following users are returned$/ do |table|

  
   @current_users.hashes.each do |user|
    false.should == true
   end
end
