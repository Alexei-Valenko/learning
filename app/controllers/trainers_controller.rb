class TrainersController < ApplicationController
  
   # GET /trainers or /trainers.json
  def index
        @trainers = Trainer.all
        render json: { trainers: @trainers}
  end

# GET /trainers/1 or /trainers/1.json
  def show
    @trainer = Trainer.find(params[:id])  
    render json: { trainer: @trainer}
  end

  # POST /trainers or /trainees.json
  def create
    @trainer = Trainer.new(trainer_params) 

    respond_to do |format|
      if @trainer.save
        format.json { render :show, status: :created, location: @trainer }
      else
        format.json { render json: @trainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainers/1 or /trainers/1.json
  def update
    respond_to do |format|
      if @trainer.update(trainer_params)
        format.json { render :show, status: :ok, location: @trainer }
      else
        format.json { render json: @trainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainers/1 or /trainers/1.json
  def destroy

    Trainee.where(trainer_id: params[:id]).destroy_all

    @trainer.destroy
    

    respond_to do |format|
      format.json { head :no_content }
    end
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
end
