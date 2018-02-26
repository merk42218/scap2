module PartOfCharacteristicsHelper
  def new_part(form)
    new_object = PartOfCharacteristic.new(partname: 'value_for_changing')
    fields = form.fields_for(:part_of_characteristics, new_object,
      :child_index => 'new_part') do |builder|
      render('characteristics/add_part_of_characteristic', fn: builder)
    end
    fields
  end
  def link_to_add_part_of_characteristic(form, person)
  	new_object = PartOfCharacteristic.new()
  	fields = form.fields_for(:part_of_characteristics, new_object,
  	:child_index => 'new_part_of_characteristic') do |builder|
  	   render('characteristics/add_part_of_characteristic', fn: builder)
	  end
  	link_to(?#, class: 'btn mbottom20 btn-info',
  	id: 'add_part_of_characteristic_link', data: {content: "#{fields}"}) do
  	fa_icon("plus") + " Новая часть характеристики"
  	end
	end
	def link_to_remove_part_of_characteristic(form)
  	form.hidden_field(:_destroy, class: 'remove_fields') +
  	link_to(?#, class: 'remove_fields remove_part_of_characteristic') do
  	 fa_icon('times', title: 'Удалить') + ' Удалить'
  	end
	end
end
