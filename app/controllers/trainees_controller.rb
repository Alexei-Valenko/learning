class TraineesController < ApplicationController
  before_action :set_trainee, only: %i[ show edit update destroy ]

  # GET /trainees or /trainees.json
  def index
    @trainer = Trainer.find(params[:trainer_id])
    @trainees = @trainer.trainees
    render json:  @trainees, each_serializer: TraineesSerializer
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
    @trainee = Trainee.new(trainee_params)

    if @trainee.save
      render json: @trainee
    else
      render json: @trainee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trainees/1 or /trainees/1.json
  def update
    if @trainer.update(trainer_params)
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
      params.require(:trainee).permit(:name, :trainer_id)
    end
end
