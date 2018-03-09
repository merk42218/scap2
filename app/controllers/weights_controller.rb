class WeightsController < ApplicationController
  before_action :set_weight, only: [:show, :edit, :update, :destroy]

  # GET /weights
  # GET /weights.json
  def index
    authorize! :index, @weights = Weight.all
  end

  # GET /weights/1
  # GET /weights/1.json
  def show
    authorize! :show, @weight
  end

  # GET /weights/new
  def new
    authorize! :create,   @weight = Weight.new
    @poc = [['', '']]
    (PartOfCharacteristic.all).each do |a|
      @poc << [a.partname, a.id]
    end
  end

  # GET /weights/1/edit
  def edit
    authorize! :edit, @weight
    @poc = [['', '']]
    (PartOfCharacteristic.all).each do |a|
      @poc << [a.partname, a.id]
    end
  end

  # POST /weights
  # POST /weights.json
  def create
    @weight = Weight.new(weight_params)

    respond_to do |format|
      if @weight.save
        format.html { redirect_to @weight, notice: 'Weight was successfully created.' }
        format.json { render :show, status: :created, location: @weight }
      else
        format.html { render :new }
        format.json { render json: @weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weights/1
  # PATCH/PUT /weights/1.json
  def update
    respond_to do |format|
      if @weight.update(weight_params)
        format.html { redirect_to @weight, notice: 'Weight was successfully updated.' }
        format.json { render :show, status: :ok, location: @weight }
      else
        format.html { render :edit }
        format.json { render json: @weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weights/1
  # DELETE /weights/1.json
  def destroy
    authorize! :destroy, @weight
    @weight.destroy
    respond_to do |format|
      format.html { redirect_to weights_url, notice: 'Weight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weight
      @weight = Weight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weight_params
      params.require(:weight).permit(:name, :weight, :part_of_characteristic_id)
    end
end
