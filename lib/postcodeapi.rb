require "postcodeapi/version"
require "rest-client"
require "ostruct"
require 'json'

module Postcodeapi

  class << self
    attr_accessor :api_url, :api_key
    def configure(&blk); class_eval(&blk); end
  end

  def self.get_street(zipcode)
    # Format the zipcode
    zipcode = format_zipcode(zipcode)
    # Perform request
    response = RestClient.get "#{@api_url}/#{zipcode}", {:content_type => :json, :accept => :json, :'Api-Key' => @api_key}
    # Return openstruct output
    res = JSON.parse(response.to_str,{symbolize_names: true})
    OpenStruct.new res[:resource]
  end

  def self.get_address(zipcode,number)
    # Format the zipcode
    zipcode = format_zipcode(zipcode)
    # Perform request
    response = RestClient.get "#{@api_url}/#{zipcode}/#{number}", {:content_type => :json, :accept => :json, :'Api-Key' => @api_key}
    # Return openstruct output
    res = JSON.parse(response.to_str,{symbolize_names: true})
    OpenStruct.new res[:resource]
  end

  def self.format_zipcode(zipcode = nil)
    if zipcode.nil? || zipcode == ""
      raise Exception.new("No zipcode provided")
    elsif (zipcode =~ /^[0-9]{4}$|[0-9]{4}[\ ]{1}[a-zA-Z]{2}$|[0-9]{4}[a-zA-Z]{2}$/).nil?
      raise Exception.new("Incorrect zipcode format (1234AB format expected)")
    else
      zipcode.gsub(" ", "").upcase
    end
  end

  def self.stringify(obj)
    if obj.is_a? Array
      obj.join
    elsif obj.is_a? Hash
      obj.merge( obj ) {|k, val| stringify val }
    end
  end

  def self.version_string
    "Postcodeapi version #{Postcodeapi::VERSION}"
  end
end

# Set default configuration
Postcodeapi.configure do
  @api_url  = 'http://api.postcodeapi.nu'
  @api_key = '1234567890abcdefghizjklmnopqrstuvwxyz'
end

