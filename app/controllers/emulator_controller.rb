require 'emul.rb'
class EmulatorController < ApplicationController
  def generate1
    workers = make_workers(1, 10)
    parts = {}
    parts["event"] = ["Вошёл", "Вышел"]
    parts["name"] = ["Проходная"]
    parts["tdate"] = 3
    p = Part.new(parts)
    p.create_new( DateTime.now(),workers.shuffle.first.id)

    # puts parts
    # a = Value.new({"state" => "Вошел", "date" => "Вышел"})
    parts = []
    parts << p
    entrance =  Emulator.new("Проходная", parts, workers)

    b = entrance.on(Time.new(2018,02,20,9,0), Time.new(2018,02,28,18,00), 2)
    render json: b
  end

  def generate2
    operations = []
    workers = make_workers(1, 10)
    parts = {}
    parts["Название операции"] = ["Перевод денег"]
    parts["Старый баланс"] = 2
    parts["Сумма"] = 2
    parts["Новый баланс"] = 2
    parts["Старый  баланс получателя"] = 2
    parts["Новый  баланс получателя"] = 2
    parts["tdate"] = 3
    operations << (p = Part.new(parts))
    # puts p
    p.create_new( DateTime.now(),workers.shuffle.first.id)
    parts = {}
    parts["Название операции"] = ["Снятие денег"]
    parts["Сумма"] = 2
    parts["Старый баланс"] = 2
    parts["Новый баланс"] = 2
    parts["Старый  баланс получателя"] = 2
    parts["Новый  баланс получателя"] = 2
    parts["tdate"] = 3
    operations << (p = Part.new(parts))
    # puts p
    p.create_new( DateTime.now(),workers.shuffle.first.id)
    parts = {}
    parts["Название операции"] = ["Обналичивание"]
    parts["Сумма"] = 2
    parts["Старый баланс"] = 2
    parts["Новый баланс"] = 2
    # parts["Старый  баланс получателя"] = 2
    # parts["Новый  баланс получателя"] = 2
    parts["tdate"] = 3
    operations << (p = Part.new(parts))

    parts = {}
    parts["Название операции"] = ["Кредит"]
    parts["Сумма"] = 2
    parts["Старый баланс"] = 2
    parts["Новый баланс"] = 2
    parts["Процент"] = 2
    # parts["Старый  баланс получателя"] = 2
    # parts["Новый  баланс получателя"] = 2
    parts["tdate"] = 3
    operations << (p = Part.new(parts))
    parts = {}
    parts["Название операции"] = ["Заявка на новую карту"]
    parts["ФИО"] = 0
    parts["Пошлина"] = 1
    parts["Стоимость"] = 2
    parts["tdate"] = 3
    operations << (p = Part.new(parts))
    operations << (p = Part.new(parts))
    parts = {}
    parts["Название операции"] = ["Открыть новый счета"]
    parts["ФИО"] = 0
    parts["Пошлина"] = 1
    parts["Стоимость"] = 2
    parts["tdate"] = 3
    operations << (p = Part.new(parts))
    # puts p
    # p.create_new( DateTime.now(),workers.shuffle.first.id)
    # puts parts
    # entrance =  Emulator.new("Проходная", parts, workers)
    # array = [a.print_info(), b.print_info]
     # operations.each do |o|
     #   o.print_info()
     # end
    bank = Emulator.new("Банк", operations, workers)
    b = bank.on(Time.new(2018,02,20,9,0), Time.new(2018,02,28,18,00), 2)
    render json: b.to_json

  end
end
