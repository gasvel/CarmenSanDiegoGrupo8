package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import tp1.Lugar
import tp1.CarmenSanDiego
import tp1.Persona

@Accessors
@Observable
class AppModelLugar {
	
	Lugar lugar
	CarmenSanDiego juego
	
	new(Lugar lugarActual, CarmenSanDiego model){
		juego = model
		lugar = lugarActual
	}
	
	def habitaResponsable() {
		juego.esResponsable(lugar.ocupante)
	}

	
	
}