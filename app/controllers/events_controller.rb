class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @trainer = Trainer.find(params[:trainer_id])
    @events = @trainer.event
    render json: { events: @events}
  end

  def show
    @events = Event.find(params[:id])
    render json: { events: @events}
  end

# POST 
  def create
    @event = Event.new(event_params)

    if @event.save
        render json: @event
      else
        render json: @trainee.errors, status: :unprocessable_entity
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
      params.require(:event).permit(:date, :hour, :length, :trainer_id)
    end
end


