# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

InformationSystem.delete_all
Address.delete_all
Person.delete_all
PartOfCharacteristic.delete_all
Characteristic.delete_all
info_sys = InformationSystem.create([{ name: 'Банк', timezone: '+3',},{ name: 'OOO Ромашка', timezone: '+2',},{ name: 'Бухгалтерия МПУ', timezone: '+3'} ])
address = Address.create([{name: 'http://localhost:3000'}, {name: 'http://fraud:3000'},
  {name: 'http://localhost:3000/emulator/generate1'},{name: 'http://localhost:3000/emulator/generate2'} ])
people = Person.create([{name: '1'}, {name: '2'}, {name: '3'},{name: '4'}])
characteristics = Characteristic.create([{name:"Проходная-1",
  information_system_id: (info_sys[0]).id, address_id: (address[0]).id, type_of_data:1, result_type:1}])
partOfC = PartOfCharacteristic.create([{partname: "Время на обеде",characteristic_id: (characteristics[0]).id, isweight: 1}])

UsersRole.delete_all
Role.delete_all
User.delete_all
roles = Role.create([{name: 'admin'},{name: 'operator'}, {name: 'user'}])

users = User.create([{password: 'qwerty', password_confirmation: 'qwerty', email: 'admin@localhost'},
  {password: 'qwerty', password_confirmation: 'qwerty', email: 'user@localhost'},
  {password: 'qwerty', password_confirmation: 'qwerty', email: 'operator@localhost'}])
users.each do |u|
  u.skip_confirmation!
  u.save!
end
ur = UsersRole.create([{:user_id => ((User.where(:email => 'admin@localhost'))[0]).id, :role_id => ( Role.where(:name => 'admin')[0]).id},
                       {:user_id =>  ((User.where(:email => "operator@localhost"))[0]).id,:role_id => ( Role.where(:name => 'operator')[0]).id },
                       {:user_id =>  ((User.where(:email => "user@localhost"))[0]).id, :role_id =>  (Role.where(:name => 'user')[0]).id}])
