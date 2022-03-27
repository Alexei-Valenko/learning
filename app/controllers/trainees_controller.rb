class TraineesController < ApplicationController
  before_action :set_trainee, only: %i[ show edit update destroy ]

  # GET /trainees or /trainees.json
  def index
    
    @trainer = Trainer.where(id:params[:trainer_id]).first  
    if @trainer.nil?
      render json: {error: "no trainer"}, status: :unprocessable_entity
    else
      @trainees = @trainer.trainees
      render json:  @trainees, each_serializer: TraineesSerializer
    end
  end

  # GET /trainees/1 or /trainees/1.json
  def show
    @trainee = Trainee.find(params[:id])
    render json: @trainee
  end

  # GET /trainees/new
  def new
    @trainee = Trainee.new
  end

  # GET /trainees/1/edit
  def edit
  end

  # POST /trainees or /trainees.json
  def create
    @trainee = Trainee.new(trainee_create_params)

    if @trainee.save
      render json: @trainee
    else
      render json: @trainee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trainees/1 or /trainees/1.json
  def update
   if not params[:event_id].nil?
      puts params[:event_id]
      puts params[:id]
      @trainee_event = TraineeEvent.new({ "trainee_id" => params[:id], "event_id" => params[:event_id]})

      if @trainee_event.save
        return render json: {"head" => :no_content}
      else
        return  render json: @trainee.errors, status: :unprocessable_entity
      end
   end

    if @trainee.update(trainee_params)
      render json: @trainee
    else
      render json: @trainee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trainees/1 or /trainees/1.json
  def destroy
    @trainee.destroy
    
    render json: {"head" => :no_content}
  end

  def default_seriaizer_options 
    {root: false}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainee
      @trainee = Trainee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trainee_params
      params.require(:trainee).permit(:name, :trainer_id, :event_id) 
    end 
    
    def trainee_create_params
    params.permit(:name, :trainer_id) 
  end
end
