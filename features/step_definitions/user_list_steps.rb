
def ping(username, channel)
   post "/visitors/ping", :username => username, :channel => channel
end

def view_for_users(channel, table) 
  table.hashes.each do |user|
    ping user[:name], channel
  end
end

Given /^the following users view '(.*)'$/ do |page, table|
  view_for_users(page, table)
end


And /^'(.*)' is idle after viewing '(.*)'$/ do |user, page|
  visitor = Visitor.new
  visitor.username = user
  visitor.channel = page
  visitor.updated_at = Time.now - 60 * 5  #5 minutes
  visitor.save!
end

When /^I request users viewing '(.*)'$/ do |page|
  @users = ping 'me', page
end

Then /^the following users are returned$/ do |table|
   table.hashes.each do |user|
    response.body.should match user[:name]
   end
end

Then /^the following users are not returned$/ do |table|
   table.hashes.each do |user|
    response.body.should_not match user[:name]
   end
end