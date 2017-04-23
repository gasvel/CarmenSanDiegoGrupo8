package tp1

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.Observable
import appModel.AppModelPartida

@Accessors
@Observable
class CarmenSanDiego {
	List<Villano> villanos
	Mapamundi mapamundi

	List<Lugar> lugares
	Pais paisElegido
	Villano villanoElegido
	Pais destinoElegido
	
	
	new(){
		villanos = new ArrayList<Villano>
		mapamundi = new Mapamundi()
	}
	
	def agregarNuevoPais(Pais pais){
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
	
	def randomWithRange(int min, int max)
	{
   		val range = (max - min) + 1  
   		return (((Math.random() * range) + min) as int)
	}
	

	
	def generarPartida() {
		
		val responsable = generarResponsable()		
		val planDeEscape = generarPlanDeEscape(responsable)
		val paisDeInicio = planDeEscape.get(0)
		val caso = new Caso(responsable, planDeEscape, paisDeInicio ,"Las Manos de Peron")
		val partida = new AppModelPartida(this, caso)
		return partida
	}
	
	// ESTO ASIGNA MAL
	
	def generarPlanDeEscape(Villano responsable) {
		var longitud = randomWithRange(mapamundi.size(),2)
		var paisesDisponibles = mapamundi.getAll()
		val planDeEscape = new ArrayList<Pais>
		while(longitud > 0){
			val posicionPais = randomWithRange(longitud, 0)
			val pais = paisesDisponibles.get(posicionPais)
			planDeEscape.add(pais)
			paisesDisponibles.remove(posicionPais)
			longitud--
		}
		asignarOcupantes(planDeEscape,responsable)
		return planDeEscape
		
	}
	
	def void asignarOcupantes(ArrayList<Pais> paises, Villano responsable) {
		paises.forEach[ if(it == paises.last()){
			it.nuevoVillano(responsable)
		}else{
			it.nuevoInformante()
		}]
		//mapamundi.agregarCuidadores(paises)
	}
	
	def generarResponsable() {
		val random = randomWithRange(villanos.size(),0)
		villanos.get(random)
	}
	

	
	
}