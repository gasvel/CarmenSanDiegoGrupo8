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
	Mapamundi mapamundi
	Caso casoActual
	Pais paisElegido
	Villano villanoElegido
	
	new(){
		villanos = new ArrayList<Villano>
		mapamundi = new Mapamundi
//		casosDisponibles = new ArrayList<Caso>
	}
	
	def agregarNuevoPais(Pais pais){
		mapamundi.agregarPais(pais)
	}

	def agregarVillano(Villano villano){
		villanos.add(villano)
	}
		
	def eliminarPaisSeleccionado() {
		var newMapamundi = mapamundi
		newMapamundi.eliminarPais(paisElegido)
		
   		ObservableUtils.firePropertyChanged(this, "mapamundi", newMapamundi)	
	}
}