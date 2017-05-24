class WelcomeController < ApplicationController
  def index
  	@alerts = Alert.all.where("is_finished" => false).order("created_at DESC")
    @hash = Gmaps4rails.build_markers(@alerts) do |alert, marker|
      marker.lat alert.latitude
      marker.lng alert.longitude
      marker.infowindow alert.desc
    end
  end

  def statistics
  	arr = Array.new
  	@p = Alert.where(level: 3).count
  	@m = Alert.where(level: 2).count
  	@l = Alert.where(level: 1).count
  	@months = Alert.group_by_month(:created_at).count
  	@alerts = Alert.group_by_day(:created_at).count
  	@aalerts = Alert.all
  end
end
