#require 'time'

class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @trainer = Trainer.where(id:params[:trainer_id]).first
    if @trainer.nil?
      render json: {error: "no trainer"}, status: :unprocessable_entity
    else
        @events = @trainer.events
        render json: { events: @events}
    end
  end

  def show
    @events = Event.find(params[:id])
    render json: { events: @events}
  end

  def new
    @event = Event.new
  end

# POST 
  def create
    @event = Event.new(event_create_params)

    if @event.save
        render json: @event
      else
        render json: { error: @event.errors}
      end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    if @event.update(event_params)
        render json: @event
      else
        render json: @trainee.errors, status: :unprocessable_entity
      end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    
    render json: {"head" => :no_content}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
        params.require(:event).permit(:date, :length, :trainer_id)
    end

    def event_create_params
        params.permit(:date, :length, :trainer_id)
      end
end


