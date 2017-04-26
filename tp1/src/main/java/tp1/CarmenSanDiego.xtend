package tp1

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import appModel.AppModelPartida
import tp1.RepoPaises
import org.uqbar.commons.utils.ApplicationContext

@Accessors
@Observable
class CarmenSanDiego {

	
	
	new(){
		
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
	
	
	def generarPlanDeEscape(Villano responsable) {
		var longitud = randomWithRange(1,repoPaises.getPaises.size()-1)
		var paisesDisponibles = new ArrayList<Pais>
		paisesDisponibles.addAll(repoPaises.getPaises)
		val planDeEscape = new ArrayList<Pais>
		while(longitud > 0){
			val posicionPais = randomWithRange(0,longitud)
			val pais = paisesDisponibles.get(posicionPais)
			planDeEscape.add(pais)
			paisesDisponibles.remove(posicionPais)
			longitud--
			
		}
		asignarOcupantes(planDeEscape, responsable)
		asignarCuidadores(paisesDisponibles)

		return planDeEscape
		
	}
	
	def asignarCuidadores(ArrayList<Pais> paises) {
		
		paises.forEach[ 
			it.nuevoCuidador() 
			repoPaises.update(it)
		]
	}
	

	
	def void asignarOcupantes(ArrayList<Pais> paises, Villano responsable) {
		paises.forEach[ 
			it.nuevoInformante()
			repoPaises.update(it)
		]
		val paisModificado = paises.last()
		paisModificado.nuevoVillano(responsable)
		repoPaises.update(paisModificado)

	}
	
	def generarResponsable() {
		val random = randomWithRange(0,repoVillanos.villanos.size()-1)
		repoVillanos.villanos.get(random)
	}
	
	def RepoVillanos getRepoVillanos(){
		ApplicationContext.instance.getSingleton(typeof(Villano))
	}
	
	def RepoPaises getRepoPaises() {
		ApplicationContext.instance.getSingleton(typeof(Pais))
	}
	

	
	
}