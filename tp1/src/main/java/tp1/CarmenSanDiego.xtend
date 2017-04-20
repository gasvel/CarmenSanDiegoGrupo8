package tp1

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import java.util.Random
import appModel.AppModelPartida

@Accessors
@Observable
class CarmenSanDiego {
	List<Villano> villanos
	Mapamundi mapamundi
	//List<Pais> mapamundi
	List<Lugar> lugares
	Pais paisElegido
	Villano villanoElegido
	Pais destinoElegido
	
	new(){
		villanos = new ArrayList<Villano>
		mapamundi = new Mapamundi()
		//mapamundi = new ArrayList<Pais>
	}
	
	def agregarNuevoPais(Pais pais){
		//mapamundi.add(pais)
		mapamundi.agregarPais(pais)
	}
	
	def setLugares(List<Lugar> listLugares){
		lugares = listLugares
	}

	def agregarVillano(Villano villano){
		villanos.add(villano)
	}
		
	def eliminarPaisSeleccionado() {
		
		mapamundi.eliminarPais(paisElegido)
		//mapamundi.remove(paisElegido)
		
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
	
	def generarPartida() {
		val randomGenerator = new Random()
		val random = randomGenerator.nextInt(villanos.size())
		val responsable = villanos.get(random)
		var longitud = (Math.floor(Math.random()*((mapamundi.size())+1)))as int//+1
		var paisesDisponibles = mapamundi.paises
		val planDeEscape = new ArrayList<Pais>
		for(var i = 0; i < longitud; i++){
			var posicionPais = randomGenerator.nextInt(longitud)
			planDeEscape.add(paisesDisponibles.get(posicionPais))
			paisesDisponibles.remove(posicionPais)
			longitud--
		}
		
		val paisDeInicio = planDeEscape.get(0)
		val caso = new Caso(responsable, planDeEscape, paisDeInicio ,"Las Manos de Peron")
		val partida = new AppModelPartida(this, caso, paisDeInicio)
		return partida
	}	
}