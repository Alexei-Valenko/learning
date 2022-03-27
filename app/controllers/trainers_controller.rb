class TrainersController < ApplicationController
  
  before_action :set_trainer, only: %i[ show update destroy ]

   # GET /trainers or /trainers.json
  def index
        @trainers = Trainer.all
        render json: { trainers: @trainers}
  end

# GET /trainers/1 or /trainers/1.json
  def show
    render json: @trainer
  end

  # POST /trainers or /trainees.json
  def create
    @trainer = Trainer.new(trainer_create_params) 

    if @trainer.save
      render json: @trainer
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trainers/1 or /trainers/1.json
  def update
    if @trainer.update(trainer_params)
      render json: @trainer
    else
      render json: @trainer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trainers/1 or /trainers/1.json
  def destroy
    @trainer.trainees.destroy_all
    @trainer.destroy    

    render json: {"head" => :no_content}   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainer
      @trainer = Trainer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trainer_params
      params.require(:trainer).permit(:name)
    end

    def trainer_create_params
      params.require(:trainer).permit(:name)
    end
end
