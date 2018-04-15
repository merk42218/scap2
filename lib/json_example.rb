class JsonExample
  include HTTParty
  base_uri 'localhost:3000'

  def self.test(name)
    # файл лежит в public

      JSON.parse get(name, query: {code: 'Какой-то параметр в качестве примера'}).body
    rescue Exception => e
      puts e.message
      return nil


  end
end
# class JsonExample
#   include HTTParty
#   base_uri 'localhost:3000'
#
#   def self.test(href= "localhost")
#     # файл лежит в public
#
#       JSON.parse get(href, query: {code: 'Какой-то параметр в качестве примера'}).body
#     rescue Exception => e
#       puts e.message
#       return nil
#
#
#   end
# end
