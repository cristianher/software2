class WelcomeController < ApplicationController
  def index
  	@alerts = Alert.all.where("is_finished" => false).order("created_at DESC")
    @hash = Gmaps4rails.build_markers(@alerts) do |alert, marker|
      marker.lat alert.latitude
      marker.lng alert.longitude
      marker.infowindow alert.desc
    end
  end
end
