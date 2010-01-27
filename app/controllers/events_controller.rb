class EventsController < ApplicationController

  def create
    @affiliate = Affiliate.find(params[:affiliate_id])
    @event = @affiliate.events.create!(params[:event])
    redirect_to @affiliate

  end
end
