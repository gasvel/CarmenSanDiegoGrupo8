package appModel

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import tp1.CarmenSanDiego
import tp1.Caso
import tp1.Pais

@Accessors
@Observable
class AppModelPartida{
	
	CarmenSanDiego model
	Caso casoActual
	Pais ubicacionActual
	Pais destinoElegido
	List<Pais> recorridoCorrecto = new ArrayList<Pais>
	List<Pais> recorridoIncorrecto = new ArrayList<Pais>
	
	new(CarmenSanDiego modelo, Caso caso, Pais paisDeInicio){
		model = modelo
		casoActual = caso
		ubicacionActual = paisDeInicio
	}
	
	def actualizarUbicacion() {
		ubicacionActual = destinoElegido
	}
}