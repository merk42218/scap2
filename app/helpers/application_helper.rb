module ApplicationHelper
  def type_of_data()
    return [["Ничего не делать", 1], ["Суммирование", 2], ["Подсчёт", 3],["Среднее арифметическое", 4], ["Время",5], ["Сотрудник",6]]
  end
  def type_of_data_hash()
    array = type_of_data()
    array.each do |e|
      e[0],e[1] = e[1], e[0]
    end
    return array

  end
end
