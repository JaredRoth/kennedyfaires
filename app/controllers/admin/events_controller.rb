class Admin::EventsController < Admin::BaseController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to admin_faire_path(@event.faire)
    else
      flash[:notice] = @event.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to admin_faire_path(@event.faire)
  end

  private

  def event_params
    params.require(:event).permit(:date, :alternate_title, :faire_id)
  end
end
