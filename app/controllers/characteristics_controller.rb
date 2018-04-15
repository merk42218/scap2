class CharacteristicsController < ApplicationController
  before_action :set_characteristic, only: [:show, :edit, :update, :destroy]

  # GET /characteristics
  # GET /characteristics.json
  def index
    authorize! :index,  @characteristics = Characteristic.all

  end

  # GET /characteristics/1
  # GET /characteristics/1.json
  def show
    authorize! :show, @characteristic
  end

  # GET /characteristics/new
  def new
    authorize! :create, @characteristic
    @is = [['', '']]
    (InformationSystem.all).each do |a|
      @is << [a.name, a.id]
    end

    @addresses = [['', '']]
    (Address.all).each do |a|
      @addresses << [a.name, a.id]
    end
    @characteristic = Characteristic.new
    @characteristic.build_address
  end

  # GET /characteristics/1/edit
  def edit
    authorize! :edit, @characteristic
    @characteristic.build_address
    @addresses = [['', '']]
    (Address.all).each do |a|
      @addresses << [a.name, a.id]
    end
    @is = [['', '']]
    (InformationSystem.all).each do |a|
      @is << [a.name, a.id]
    end
  end

    # ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    # ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    # ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    # ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    # ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    # ********************** Доступные операции
    def type_of_data()
      return [["Ничего не делать", 1], ["Суммирование", 2], ["Подсчёт", 3],["Среднее арифметическое", 4], ["Время",5]]
    end
    # ********************** Меняет значения местами

    def type_of_data_hash()
      array = type_of_data()
      array.each do |e|
        e[0],e[1] = e[1], e[0]
      end
      return Hash[*array.flatten]
    end


    # **********************  Ищем часть характеристики по названию
    def find_part_of_characteristic(parts, v, characteristic)
      @other = []
      @tmp = []
      @time_name = 0
      @person_id = 0
      @calculated_field_name = 0
      @operation = 0
      parts.each do |part|
        @tmp << (part[1]).type_of_data
        td = (part[1]).type_of_data
        if td == 5
          @time_name = (part[1]).partname
          time = @time_name
        elsif td == 6
          @person_id = (part[1]).partname
        elsif td!=1
          @calculated_field_name = (part[1]).partname
          @operation = td
        end
          @other << part[0]

      end

      for_create = []
      @connect = (Connection.create([{calculated_field: (v[@calculated_field_name]),
         operation: @operation, characteristic: characteristic, employ: @person_id, ctime: v[@time_name]}]))[0]
      @other.each do |o|

        characteristic_value = CharacteristicValue.create([{part_of_characteristic_id: (parts[o]).id,
          person_id: v[@person_id], time: (DateTime.parse v[@time_name]),value: v[o]}])
          @connect.characteristic_values << characteristic_value
        # raise "HERE"
      end

    end
    def load_from_json_is()
        # Передаём id рассматриваемой характеристики
        id = params[:characteristic_id]
        # Рассматриваемая характеристика
        @characteristic = Characteristic.find(id)
        # Выбираем все части характеристики рассматриваемой системы
        @part_of_characteristics = @characteristic.part_of_characteristics
        # Получаем ссылку рассматриваемой системы
        @address = @characteristic.address.name
        # Получаем хэш-массив (имя: сам объект части характеристики)
        names = Hash[*(@part_of_characteristics.map {|p| [p.partname, p]}).flatten]
        # Загружаем хэш-массив данных с адреса
        values = Lfj.load_char_parts(@address)
        # Меняет значения местами
        math_hash = type_of_data_hash()
        # Проходимся по всем записям и создаём объекты
        values.each do |v|

           find_part_of_characteristic(names, v, @characteristic)

        end
    end
    def add_time()
      id = params[:id]
      @characteristic = Characteristic.find(id)
       # raise ((params)).inspect
      # if !(params[:q]).nil?
      #   @time = params[:q]
      # else
      #   @time
      # end
      # # raise ((@characteristic).inspect + (@time).inspect)
      # raise (@time).inspect
    end
    def add_time2()
      id = params[:id]
      @characteristic = Characteristic.find(id)
       # raise ((params)).inspect
      if !(params[:q]).nil?
        @time = params[:q]
      else
        @time = 0

      end
      @connections= @characteristic.connections
      @operation = @connections.first.operation
      min = @characteristic.connections.pluck('min(ctime)').first
      a = @characteristic.connections.group("employ, characteristic_id,  extract(epoch from ctime)::integer / #{@time.to_i}").pluck('count(*)')#,  @time.to_i).pluck('count(*)') #min.strftime('%H:%M'),


      # raise ((@characteristic).inspect + (@time).inspect)
      raise (a).inspect
      redirect_to  characteristics_path()
    end



  end

  # ///////////////////////////////////////////////////////////////////////////////////////////////
  # ///////////////////////////////////////////////////////////////////////////////////////////////
  # ///////////////////////////////////////////////////////////////////////////////////////////////
  # ///////////////////////////////////////////////////////////////////////////////////////////////
  # ///////////////////////////////////////////////////////////////////////////////////////////////
  # ///////////////////////////////////////////////////////////////////////////////////////////////
  # ///////////////////////////////////////////////////////////////////////////////////////////////
  # POST /characteristics
  # POST /characteristics.json
  def create
    @characteristic = Characteristic.new(characteristic_params)

    respond_to do |format|
      if @characteristic.save
        format.html { redirect_to @characteristic, notice: 'Characteristic was successfully created.' }
        format.json { render :show, status: :created, location: @characteristic }
      else
        format.html { render :new }
        format.json { render json: @characteristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characteristics/1
  # PATCH/PUT /characteristics/1.json
  def update
    respond_to do |format|
      if @characteristic.update(characteristic_params)
        format.html { redirect_to @characteristic, notice: 'Characteristic was successfully updated.' }
        format.json { render :show, status: :ok, location: @characteristic }
      else
        format.html { render :edit }
        format.json { render json: @characteristic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characteristics/1
  # DELETE /characteristics/1.json
  def destroy
  authorize! :destroy, @characteristic
  @characteristic.destroy
  respond_to do |format|
    format.html { redirect_to characteristics_url, notice: 'Characteristic was successfully destroyed.' }
    format.json { head :no_content }
  end
end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_characteristic
    @characteristic = Characteristic.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def characteristic_params
    params.require(:characteristic).permit(
  :name,
  :information_system_id,
  # :type_of_data,
  # :result_type,
  :address_id,
  part_of_characteristics_attributes: [:id, :_destroy,:partname,:isweight,:type_of_data,:result_type ],
  address_attributes: [:id, :name]
)
    # , address_attributes: [:name, :id])
  end
