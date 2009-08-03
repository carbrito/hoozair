class VisitorsController < ApplicationController
  def ping
    puts "starting visit for #{params[:user_name]}"
    @visitor = Visitor.find_or_create_by_username(params[:user_name])

    puts "preparing to save visit for #{params[:user_name]}"
    @visitor.save!
    puts "getting other users on  #{params[:channel]}"

    @visitors = Visitor.find_by_channel(params[:channel])

    puts "returning  #{@visitors.to_json}"
    render :json => @visitors.to_json
    puts "done"
  end
end
