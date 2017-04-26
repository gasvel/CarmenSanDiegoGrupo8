package appModel


import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import tp1.CarmenSanDiego
import tp1.Pais
import tp1.Villano

@Accessors
@Observable
class AppModelPartida{
	
	
	Pais ubicacionActual
	Pais destinoElegido
	CarmenSanDiego juego

	
	new(CarmenSanDiego modelo){
		juego = modelo
		ubicacionActual = juego.casoActual.lugarDeRobo
		
	}
	
	def actualizarUbicacion() {
		juego.nuevaUbicacion(destinoElegido)


	}
	
	def nuevaOrdenDeArresto(Villano villanoElegido) {
		juego.emitirOrdenDeArresto(villanoElegido)
	}
	

	
	
}