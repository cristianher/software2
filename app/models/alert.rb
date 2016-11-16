class Alert < ApplicationRecord
	
  def to_l()
  	if self.level == 1
  		"Leve"
  	elsif self.level == 2
  		"Moderado"
  	else
  		"Peligroso"
  	end
  end
end
