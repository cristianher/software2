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

		if(params[:month].present?)
			st_date = Date.parse(params[:month])
			date_range = st_date.beginning_of_month..st_date.end_of_month
			arr = Array.new
			@p = Alert.where(level: 3).where(:created_at =>  date_range).count
			@m = Alert.where(level: 2).where(:created_at =>  date_range).count
			@l = Alert.where(level: 1).where(:created_at =>  date_range).count
			@months = Alert.where(:created_at =>  date_range).group_by_month(:created_at).count
			@alerts = Alert.where(:created_at =>  date_range).group_by_day(:created_at).count
			@aalerts = Alert.all.where(:created_at =>  date_range)
		else
			arr = Array.new
			@p = Alert.where(level: 3).count
			@m = Alert.where(level: 2).count
			@l = Alert.where(level: 1).count
			@months = Alert.group_by_month(:created_at).count
			@alerts = Alert.group_by_day(:created_at).count
			@aalerts = Alert.all
		end
	end
end
