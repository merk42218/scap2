module Lfj
  extend ActiveSupport::Concern
  include HTTParty
  base_uri ''

  def self.load_char_parts(address)
    begin
    res = JSON.parse get(address).body
    rescue Exception => e
      return e.message
    end
    return res
  end
end
