class VisitorsController < ApplicationController
  def ping
    @now = Time.current
    @visitor = Visitor.find_or_create_by_username(params[:username])
    @visitor.channel = params[:channel]
    @visitor.created_at = @now
    @visitor.save!
    Visitor.delete_all("created_at < '#{@now - 60}'")
    @visitors = Visitor.find_all_by_channel(params[:channel])
    respond_to do |format|
      format.json {render :json => @visitors.to_json  }
    end
  end
end

class Time  # hack to mock Time.now only once
  def current
    return now
  end
end 
