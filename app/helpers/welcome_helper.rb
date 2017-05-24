module WelcomeHelper
	def toHuman(m)
		months = [ "Enero", "Febrero", "Mar<o", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ]
      	months[m-1]
   end
end
