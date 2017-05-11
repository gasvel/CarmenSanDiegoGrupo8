package tp1

import java.util.ArrayList
import org.uqbar.commons.utils.ApplicationContext
import java.util.List

class GeneradorDeCasos {
	
	List<Caso> casos = new ArrayList<Caso>
	
	def randomWithRange(int min, int max)
	{
   		val range = (max - min) + 1  
   		return (((Math.random() * range) + min) as int)
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


		return planDeEscape
		
	}
	
	
	
	def generarResponsable() {
		val random = randomWithRange(0,repoVillanos.villanos.size()-1)
		repoVillanos.villanos.get(random)
	}
	
	def obtenerCaso(){
		val num = randomWithRange(0,casos.size()-1)
		return casos.get(num)
		
	}
	
	def RepoVillanos getRepoVillanos(){
		ApplicationContext.instance.getSingleton(typeof(Villano))
	}
	
	def RepoPaises getRepoPaises() {
		ApplicationContext.instance.getSingleton(typeof(Pais))
	}
	
	def generarCasosDisponibles(int cantCasos) {
		for(var i = 0 ; i<cantCasos;i++){
			val responsable = generarResponsable()		
			val planDeEscape = generarPlanDeEscape(responsable)
			val paisDeInicio = planDeEscape.get(0)
			val caso = new Caso(i,responsable, planDeEscape, paisDeInicio ,"Las Manos de Peron")
			casos.add(caso)
			val paises = new ArrayList<Pais>
			paises.addAll(repoPaises.paises)

		}
		return casos
	}
	

	
}