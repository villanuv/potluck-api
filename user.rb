require 'net/http'
require 'json'
require 'uri'

class User
  attr_accessor :email, :api, :items

  def initialize
    @email = nil
    @api   = nil
    @items = []
  end

  def question_prompt(text)
    print "#{text} > "
    return gets.chomp
  end

  def get_email
    self.email = question_prompt("email")
  end

  def http_post_response(directory, hash)
    url = "http://potluck-api.herokuapp.com/#{directory}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, initheader = {'Content-Type' =>'application/json'})
    request.body = hash.to_json
    return http.request(request)
  end

  def http_get_response(hash)
    url = "http://potluck-api.herokuapp.com/items"
    uri = URI.parse(url)
    uri.query = URI.encode_www_form(hash)
    response = Net::HTTP.get_response(uri)
    return JSON.parse(response.body)
  end

  def get_api_key
    user_email_hash = { user: { email: self.email }}
    response = http_post_response("users", user_email_hash)
    user_hash = JSON.parse(response.body)
    self.api = user_hash['api_key']
  end

  def see_all_items
    api_key = { api_key: self.api }
    items_hash = http_get_response(api_key)
    puts items_hash.map{|item| item['id'].to_s + ') UL Employee #' + item['user_id'].to_s + ': ' + item['name']}
  end

  def add_item
    self.items << Item.new(question_prompt("item to bring"))
    item_hash = { api_key: self.api, item: { name: self.items.last.name }}
    http_post_response("items", item_hash)
  end
end