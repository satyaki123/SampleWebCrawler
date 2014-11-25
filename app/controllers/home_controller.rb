class HomeController < ApplicationController
  def index
    @screen_name =[]
    @text = []
    @google_spot  = []
    @google_spot_lat = []
    @google_spot_lng = []
    @google_formatted_address = []
    @google_formatted_phone_number = []
  end

  def search
    @message =params[:hello]
    puts @message
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "zzHmyRV6zwg2a49nwBfEuKXoH"
      config.consumer_secret     = "eM8m9AKPijc532DA5szJ3v9SC52CZV62qLr0rKPZD0bHnIQVAn"
      config.access_token        = "2907123366-NMtpa8ol7x9hPfkiPHP1UKvmHSrKebdQFAGBuZC"
      config.access_token_secret = "L4oAQmJYfWjVbR1SURRvUA3QhCxS6rrHoGKqxnF8cLcdn"
    end
    @screen_name = []
    @text = []
    client.search(@message, result_type: "recent").take(10).collect do |tweet|
     @screen_name << tweet.user.screen_name
     @text << tweet.text    
    end
    @google_client = GooglePlaces::Client.new("AIzaSyDdkxBvfYcMr8tOz6-BUmZUHni3X5z4Zu8")
    @spot = @google_client.spots_by_query(@message).take(10)
        @google_spot  = []
    @google_spot_lat = []
    @google_spot_lng = []
    @google_formatted_address = []
    @google_formatted_phone_number = []
    @spot.collect do |spot|
     @google_spot <<  spot.name
     @google_spot_lat << spot.lat    
     @google_spot_lng << spot.lng
     @google_formatted_address << spot.formatted_address
     @google_formatted_phone_number << spot.formatted_phone_number
    end
    render 'index'
  end
  
  def fb_search
    @user =nil
    render 'fb'
  end
  
  def fb_results
    @message1 =params[:fb_text]
    begin
      @user = FbGraph::User.me("661208107330805|5IrEoXCReFDFSxeB1j9Zju_XNOI")
      @user = FbGraph::User.fetch(@message1)
      puts @user.name
    rescue  Exception => e
      @user = nil
    end
    render 'fb'
  end
end
