package tp1


import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableObject
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable

class CarmenSanDiego {
	List<Villano> villanos
	List<Pais> mapamundi
	Caso casoActual
	Pais paisElegido
	

	
	new(){
		villanos = new ArrayList<Villano>
		mapamundi = new ArrayList<Pais>
		
//		casosDisponibles = new ArrayList<Caso>

	}

	
	def getCasoActual(){
		casoActual
	}
	
	def setCasoActual(Caso caso){
		casoActual = caso
	}
	
	def nuevoPais(String nombre, List<String> caracteristicas, List<Lugar> lugares, List<Pais> conexiones ){
		var pais = new Pais(nombre, caracteristicas, lugares, conexiones)
		mapamundi.add(pais)
	}
	
	def agregarVillano(Villano villano){
		villanos.add(villano)
	}
	
	def getMapamundi(){
		mapamundi
	}
	
	def setMapamundi(List<Pais> mapa){
		mapamundi = mapa
	}
	
	def getPaisElegido(){
		paisElegido
	}
	

	
	def eliminarPaisSeleccionado() {
		
		var newMapamundi = mapamundi
		newMapamundi.remove(paisElegido)
		
		
   		ObservableUtils.firePropertyChanged(this, "mapamundi", newMapamundi)
		
	}

}