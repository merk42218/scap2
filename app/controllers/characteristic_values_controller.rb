class CharacteristicValuesController < ApplicationController
  before_action :set_characteristic_value, only: [:show, :edit, :update, :destroy]

  # GET /characteristic_values
  # GET /characteristic_values.json
  def index
   authorize! :index,  @characteristic_values = CharacteristicValue.all

  end

  # GET /characteristic_values/1
  # GET /characteristic_values/1.json
  def show
    authorize! :show, @characteristic_value
  end

  # GET /characteristic_values/new
  def new
    authorize! :create,  @characteristic_value = CharacteristicValue.new
    @poc = [['', '']]
    (PartOfCharacteristic.all).each do |a|
      @poc << [a.partname, a.id]
    end
    @people = [['', '']]
    (Person.all).each do |a|
      @people << [a.name, a.id]
    end
  end

  # GET /characteristic_values/1/edit
  def edit
    authorize! :edit, @characteristic_value
    @poc = [['', '']]
    (PartOfCharacteristic.all).each do |a|
      @poc << [a.partname, a.id]
    end
    @people = [['', '']]
    (Person.all).each do |a|
      @people << [a.name, a.id]
    end
  end

  # POST /characteristic_values
  # POST /characteristic_values.json
  def create
    authorize! :create,    @characteristic_value = CharacteristicValue.new(characteristic_value_params)

    respond_to do |format|
      if @characteristic_value.save
        format.html { redirect_to @characteristic_value, notice: 'Characteristic value was successfully created.' }
        format.json { render :show, status: :created, location: @characteristic_value }
      else
        format.html { render :new }
        format.json { render json: @characteristic_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characteristic_values/1
  # PATCH/PUT /characteristic_values/1.json
  def update
    respond_to do |format|
      if @characteristic_value.update(characteristic_value_params)
        format.html { redirect_to @characteristic_value, notice: 'Characteristic value was successfully updated.' }
        format.json { render :show, status: :ok, location: @characteristic_value }
      else
        format.html { render :edit }
        format.json { render json: @characteristic_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characteristic_values/1
  # DELETE /characteristic_values/1.json
  def destroy
    authorize! :destroy, @characteristic_value
    @characteristic_value.destroy
    respond_to do |format|
      format.html { redirect_to characteristic_values_url, notice: 'Characteristic value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_characteristic_value
      @characteristic_value = CharacteristicValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def characteristic_value_params
      params.require(:characteristic_value).permit(:value, :part_of_characteristic_id, :person_id, :time)
    end
end
