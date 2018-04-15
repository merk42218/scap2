module StatHelper
  def stat1
  bar_chart Characteristic.all.group(:address_id).count, height: '500px', library: {
    title: {text: 'Вид результата', x: -20},
    yAxis: {
       allowDecimals: false,
       title: {
           text: 'Характеристика'
       }
    },
    xAxis: {
       title: {
           text: 'Вид'
       }
    }
  }
end
def competitions_by_year
  line_chart characteristics_path, library: {
      title: {text: 'Competitions by year', x: -20},
      yAxis: {
          crosshair: true,
          title: {
              text: 'Competitions count'
          }
      },
      xAxis: {
          crosshair: true,
          title: {
              text: 'Year'
          }
      }
  }
end
end
