package appModel

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import tp1.CarmenSanDiego
import tp1.Caso
import tp1.Pais
import tp1.OrdenDeArresto
import tp1.Villano

@Accessors
@Observable
class AppModelPartida{
	
	
	Caso casoActual
	Pais ubicacionActual
	Pais destinoElegido
	OrdenDeArresto ordenDeArresto
	List<Pais> recorridoCorrecto = new ArrayList<Pais>
	List<Pais> recorridoIncorrecto = new ArrayList<Pais>
	List<Pais> recorrido = new ArrayList<Pais>
	
	new(CarmenSanDiego modelo, Caso caso){
		casoActual = caso
		ubicacionActual = caso.lugarDeRobo
	}
	
	def actualizarUbicacion() {
		recorrido.add(ubicacionActual)
		ubicacionActual = destinoElegido
		ObservableUtils.firePropertyChanged(this,"ubicacionActual")
		ObservableUtils.firePropertyChanged(ubicacionActual,"lugaresDeInteres")
	}
	
	def nuevaOrdenDeArresto(Villano villanoElegido) {
		ordenDeArresto = new OrdenDeArresto(villanoElegido)
	}
	
	
}