json.extract! alert, :id, :latitude, :longitude, :description, :level, :created_at, :updated_at
json.url alert_url(alert, format: :json)