# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


info_sys = InformationSystem.create([{ name: 'Банк', timezone: '+3',},{ name: 'OOO Ромашка', timezone: '+2',},{ name: 'Бухгалтерия МПУ', timezone: '+3'} ])
address = Address.create([{name: 'http://localhost:3000'}, {name: 'http://fraud:3000'} ])
people = Person.create([{name: '1'}, {name: '2'}, {name: '3'},{name: '4'}])
characteristics = Characteristic.create([{name:"Проходная-1", information_system_id: (info_sys[0]).id, address_id: (address[0]).id, type_of_data:1, result_type:1}])
partOfC = PartOfCharacteristic.create([{partname: "Время на обеде",characteristic_id: (characteristics[0]).id, isweight: 1}])
