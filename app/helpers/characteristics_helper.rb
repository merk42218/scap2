module CharacteristicsHelper
  def select_characteristic()
      result = [['', '']]
      (Characteristic.all).each do |a|
        result << [a.name, a.id]
      end
      return result
  end
  def select_information_systems()

    is = [['', '']]
    (InformationSystem.all).each do |a|
      is << [a.name, a.id]
    end
    return is
  end
  def select_addresses()
    addresses = [['', '']]
    (Address.all).each do |a|
      addresses << [a.name, a.id]
    end
    return addresses
  end


  def link_to_add_characteristic(form, person)
  	new_object = Characteristic.new()
  	fields = form.fields_for(:characteristics, new_object,
  	:child_index => 'new_characteristic') do |builder|
  	render('information_systems/add_characteristic', fn: builder)
  	end
  	link_to(?#, class: 'btn mbottom20 btn-info',
  	id: 'add_characteristic_link', data: {content: "#{fields}"}) do
  	fa_icon("plus") + " Новый комментарий"
  	end
  	end
  	def link_to_remove_characteristic(form)
  	form.hidden_field(:_destroy, class: 'remove_fields') +
  	link_to(?#, class: 'remove_fields remove_characteristic') do
  	fa_icon('times', title: 'Удалить') + ' Удалить'
  	end
  	end
end
