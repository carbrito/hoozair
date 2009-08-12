class VisitorsController < ApplicationController
  def ping
    @visitor = Visitor.find_or_create_by_username(params[:username])
    @visitor.channel = params[:channel]
    @visitor.save!
    @visitors = Visitor.find_all_by_channel(params[:channel])
    respond_to do |format|
      format.json {render :json => @visitors.to_json  }
    end
  end
end
