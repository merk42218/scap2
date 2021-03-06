class PartOfCharacteristicsController < ApplicationController
  # load_and_authorize_resource
  before_action :set_part_of_characteristic, only: [:show, :edit, :update, :destroy]

  # GET /part_of_characteristics
  # GET /part_of_characteristics.json
  def index
    authorize! :index, @part_of_characteristics = PartOfCharacteristic.all
  end

  # GET /part_of_characteristics/1
  # GET /part_of_characteristics/1.json
  def show
    authorize! :show, @part_of_characteristic
  end

  # GET /part_of_characteristics/new
  def new
    authorize! :create,  @part_of_characteristic = PartOfCharacteristic.new
    @cs = [['', '']]
    (Characteristic.all).each do |a|
      @cs << [a.name, a.id]
    end
  end

  # GET /part_of_characteristics/1/edit
  def edit
    authorize! :edit, @part_of_characteristic
    @cs = [['', '']]
    (Characteristic.all).each do |a|
      @cs << [a.name, a.id]
    end
  end

  # POST /part_of_characteristics
  # POST /part_of_characteristics.json
  def create
    @part_of_characteristic = PartOfCharacteristic.new(part_of_characteristic_params)

    respond_to do |format|
      if @part_of_characteristic.save
        format.html { redirect_to @part_of_characteristic, notice: 'Part of characteristic was successfully created.' }
        format.json { render :show, status: :created, location: @part_of_characteristic }
      else
        format.html { render :new }
        format.json { render json: @part_of_characteristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /part_of_characteristics/1
  # PATCH/PUT /part_of_characteristics/1.json
  def update
    respond_to do |format|
      if @part_of_characteristic.update(part_of_characteristic_params)
        format.html { redirect_to @part_of_characteristic, notice: 'Part of characteristic was successfully updated.' }
        format.json { render :show, status: :ok, location: @part_of_characteristic }
      else
        format.html { render :edit }
        format.json { render json: @part_of_characteristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_of_characteristics/1
  # DELETE /part_of_characteristics/1.json
  def destroy
    authorize! :destroy, @part_of_characteristic
    @part_of_characteristic.destroy
    respond_to do |format|
      format.html { redirect_to part_of_characteristics_url, notice: 'Part of characteristic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part_of_characteristic
      @part_of_characteristic = PartOfCharacteristic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_of_characteristic_params
      params.require(:part_of_characteristic).permit(:partname, :characteristic_id, :isweight, :type_of_data,
        :result_type)
    end
end
