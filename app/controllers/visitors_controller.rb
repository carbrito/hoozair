class VisitorsController < ApplicationController
  def ping
    @visitor = Visitor.find_or_create_by_username(params[:user_name])
    @visitor.save!
    @visitors = Visitor.find_by_channel(params[:channel])
    render :json => @visitors.to_json
  end
end
