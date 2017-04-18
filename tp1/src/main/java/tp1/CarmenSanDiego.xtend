package tp1

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable
class CarmenSanDiego {
	List<Villano> villanos
	//Mapamundi mapamundi
	List<Pais> mapamundi
	Caso casoActual
	Pais paisElegido
	Villano villanoElegido
	Pais ubicacionActual
	List<Pais> recorridoCorrecto = new ArrayList<Pais>
	List<Pais> recorridoIncorrecto = new ArrayList<Pais>
	
	new(){
		villanos = new ArrayList<Villano>
		//mapamundi = new Mapamundi()
		mapamundi = new ArrayList<Pais>
//		casosDisponibles = new ArrayList<Caso>
	}
	
	def agregarNuevoPais(Pais pais){
		mapamundi.add(pais)
		//mapamundi.agregarPais(pais)
	}

	def agregarVillano(Villano villano){
		villanos.add(villano)
	}
	
	def agregarPaisCorrecto(Pais pais) {
		recorridoCorrecto.add(pais)
	}
	
	def setUbicacionActual(Pais paisActual){
		ubicacionActual = paisActual
	}
		
	def eliminarPaisSeleccionado() {
		
		//newMapamundi.eliminarPais(paisElegido)
		mapamundi.remove(paisElegido)
		
   		ObservableUtils.firePropertyChanged(this, "mapamundi")	
	}
	
	def actualizarVillanos() {
		ObservableUtils.firePropertyChanged(this,"villanos")
	}
	
	def actualizarVillano() {
		ObservableUtils.firePropertyChanged(this,"villanoElegido")
	}
	
	def getVillanoElegido(){
		villanoElegido
	}
	
	def getPaisElegido(){
		paisElegido
	}
	
	def getCasoActual(){
		casoActual
	}
	
	
}