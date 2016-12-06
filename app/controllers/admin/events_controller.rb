class Admin::EventsController < Admin::BaseController
  def index
  end

  def new
    @event = Event.new
  end
end
