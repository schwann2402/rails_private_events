class EventsController < ApplicationController

  before_action :authenticate_user!, except: :index

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = 'You have successfully created an event!'
      redirect_to events_path
    else 
      render :new, notice: 'Your event was not created'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update
      redirect_to @event, notice: 'Your event was updated'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def invitation
    @event = Event.find(params[:id])
    if @event.attendees.include?(current_user)
      redirect_to @event, notice: 'You are already going to this event'
    else
      @event.attendees << current_user
      redirect_to @event, notice: 'You are now going to this event'
    end
  end

  def cancel_invitation
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    redirect_to @event, notice: 'You are now not going to this event'
  end
  
  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
