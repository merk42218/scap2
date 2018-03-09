$ABC = ('0'..'9').to_a + ('0'..'9').to_a + ('A'..'Z').to_a + ('0'..'9').to_a + ('0'..'9').to_a
# ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
# Генерируем строку из n символов
def generate_string(n)
  str = ""
  n.times do |c|
    str+=$ABC[(rand($ABC.size))]
  end
   str
end
# Генерируем целое число до n
def generate_int(n)
   rand(n)
end
# Генерируем вещественное до n
def generate_float(n, r = 2)
   (rand(n) + rand()).round(r)
end
# генерирует работников с идентификаторами от from до to
def make_workers(from, to)
  workers = []
  for i in from..to
    workers << Employee.new(i)
  end
  return workers
end
def create_json(array)
  str = "["
  array.each do |e|
    str = str + e + ","
  end
  str[str.size-1] = "]"
  puts str
end
# Создать характеристики
def parse_for_part()

end
def parse_for_value(p)
   (Value.new(p)).print_info
end
# ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

# Эмулятор
class Emulator
  attr_accessor :name, :part_of_characteristics, :users
  def initialize(name, part_of_characteristics = {}, users = [])
    @name                    = name
    @part_of_characteristics = part_of_characteristics
    @users                   = users


  end
  def print_info
    puts "Эмулятор событий для информационной системы \"" + self.name + "\""
    puts "У данного эмулятора могут быть следующие части характеристики со следующими значениями: "
    (self.part_of_characteristics).each do |e|
       e.print_info
    end

  end
  # Запускаем, передавая время и количество записей

  def on(data_start, data_finish, interval)
    strs = []
    keys = self.part_of_characteristics.size

    p strs
    while (data_start < data_finish)
      if (data_start.hour >=9) && (data_start.hour <=17)
        p = (self.part_of_characteristics[generate_int(keys)]).create_new(data_start,self.users.shuffle.first.id)
        strs << p
        data_start += 120 +  generate_int(60*300)
        # p data_start
      else
        data_start += 60*60

      end


    end
    return strs
    # p strs
    # p strs.size
    #
    # p data_start
    # p data_finish
    # self.users.each do |e|
    #
    #   e.print_info
    # end
  end


end
# Сотрудник
class Employee
  # Идентификатор сотрудника, находится на рабочем месте или нет
  attr_accessor :id, :on_work
  def initialize(id, on_work = 0)
    @id      = id
    @on_work = on_work
  end
  def print_info ()
    str = "Идентификатор сотрудника = #{self.id}. " + "В данный момент он находится"
    str +=  (self.on_work == 1) ? "на работе" : " не на рабочем месте"
    puts str
  end
end

class Part
  attr_accessor :params, :users
  def initialize( params, users = [])
    @params = params
    @users = users
    # puts params
  end
  def print_info
    str = " Характеристики "

    (self.params.keys).each do |e|
      str = str + "\"" + e + "\":" + "\"" + ((self.params)[e]).to_s + "\","
    end
    puts str
  end
  def create_new(date, user_id)
    hash = {}
    hash["user_id"] = (user_id)
    hash["date"] = date
    (self.params).keys.each do |e|
      # puts (self.params)[e]

      if ((self.params)[e]).class == Array
        hash[e] = (((self.params)[e]).shuffle  ).first
      elsif ((self.params)[e]).class == Hash

      else
        case (self.params)[e]
        when 0
          hash[e] = generate_string(5)
        when 1
          hash[e] = generate_int(100)
        when 2
          hash[e] = generate_float(1000)
        # when 3
        #   hash[e] = DateTime.now()
        end
      end

    end
      return hash
  end
end
class Value
  attr_accessor :tdate, :part_name, :params, :user_id
  def initialize(params)
    @params = params
  end
  def print_info()
      str = "{"
      (self.params.keys).each do |e|
        if ((self.params)[e]).class != String
          (self.params)[e] = ((self.params)[e]).to_s
        end
        str = str + "\"" + e + "\":" + "\"" + (self.params)[e] + "\","
      end
      str[str.size-1] = "}"
    # puts str
    return str
  end
end
# Счет


# 0 - сгенерировать строку
# 1 - сгенерировать число целое
# 2 - сгенерировать вещественное число
# 3 - сгенерировать дату
# Эмулятор для проходной
