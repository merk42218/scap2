class InformationSystemsController < ApplicationController
  before_action :set_information_system, only: [:show, :edit, :update, :destroy]

  # GET /information_systems
  # GET /information_systems.json
  def index
    authorize! :index,  @information_systems = InformationSystem.all
  end

  # GET /information_systems/1
  # GET /information_systems/1.json
  def show
    authorize! :show, @information_system
  end

  # GET /information_systems/new
  def new
    authorize! :create,  @information_system = InformationSystem.new
  end

  # GET /information_systems/1/edit
  def edit
    authorize! :edit, @information_system
  end

  # POST /information_systems
  # POST /information_systems.json
  def create
    @information_system = InformationSystem.new(information_system_params)

    respond_to do |format|
      if @information_system.save
        format.html { redirect_to @information_system, notice: 'Information system was successfully created.' }
        format.json { render :show, status: :created, location: @information_system }
      else
        format.html { render :new }
        format.json { render json: @information_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /information_systems/1
  # PATCH/PUT /information_systems/1.json
  def update
    respond_to do |format|
      if @information_system.update(information_system_params)
        format.html { redirect_to @information_system, notice: 'Information system was successfully updated.' }
        format.json { render :show, status: :ok, location: @information_system }
      else
        format.html { render :edit }
        format.json { render json: @information_system.errors, status: :unprocessable_entity }
      end
    end
  end
  def load_from_json_is()
    respond_to do |format|
      format.js do
        @pid =  (params[:address_id])
        @adr = Address.find(@pid)
        @oid = params['oid']
        @parts = []
        puts "======================================================================================================================================"
        puts @adr.name
        p = Lfj.load_char_parts(@adr.name)
        unless p.kind_of?(String)
          example_row = p[0]
          example_row.keys[1..-1].each do |key|
            @parts << [key]
          end
        end
      end
    end
  end
  # DELETE /information_systems/1
  # DELETE /information_systems/1.json
  def destroy
    authorize! :destroy, @information_system
    @information_system.destroy
    respond_to do |format|
      format.html { redirect_to information_systems_url, notice: 'Information system was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information_system
      @information_system = InformationSystem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def information_system_params
      params.require(:information_system).permit(:name, :timezone,
      characteristics_attributes: [:_destroy, :id,   :name,
        :information_system_id,
        :type_of_data,
        :result_type,
        :address_id,
        part_of_characteristics_attributes: [:id, :_destroy,:partname,:isweight ],
        address_attributes: [:id, :name] ])
    end
end
