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
import tp1.Lugar

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
	Lugar lugar1
	Lugar lugar2
	Lugar lugar3
	
	new(CarmenSanDiego modelo, Caso caso){
		casoActual = caso
		ubicacionActual = caso.lugarDeRobo
		
		//Solucion solo para garantizar binding en los botones de la ventana
		//No esta bueno por le laburo extra
		lugar1 = ubicacionActual.lugaresDeInteres.get(0)
		lugar2 = ubicacionActual.lugaresDeInteres.get(1)
		lugar3 = ubicacionActual.lugaresDeInteres.get(2)
	}
	
	def actualizarUbicacion() {
		recorrido.add(ubicacionActual)
		ubicacionActual = destinoElegido
		lugar1 = ubicacionActual.lugaresDeInteres.get(0)
		lugar2 = ubicacionActual.lugaresDeInteres.get(1)
		lugar3 = ubicacionActual.lugaresDeInteres.get(2)
		ObservableUtils.firePropertyChanged(this,"lugar1")
	}
	
	def nuevaOrdenDeArresto(Villano villanoElegido) {
		ordenDeArresto = new OrdenDeArresto(villanoElegido)
		ObservableUtils.firePropertyChanged(this,"ordenDeArresto")
	}
	
	def villanoAtrapadoCorrecto() {
		ordenDeArresto.villanoConOrden == casoActual.responsable
	}
	
	def generoOrdenDeArresto() {
		ordenDeArresto != null
	}
	
	
}