package tp1

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import appModel.AppModelPartida
import tp1.RepoPaises
import org.uqbar.commons.utils.ApplicationContext
import java.util.List
import adapter.PaisSoloNombreAdapter
import adapter.PaisAdapter

@Accessors
@Observable
class CarmenSanDiego {

	Caso casoActual
	List<Caso> casosDisponibles = new ArrayList<Caso>
	GeneradorDeCasos generador = new GeneradorDeCasos()
		

	
	
	new(){
		casosDisponibles = generador.generarCasosDisponibles(4)
		
	}
		
	def randomWithRange(int min, int max)
	{
   		val range = (max - min) + 1  
   		return (((Math.random() * range) + min) as int)
	}
	
	

	
	def generarPartida() {
		
		casoActual = generador.obtenerCaso()
	}
	
	
	
	def RepoVillanos getRepoVillanos(){
		ApplicationContext.instance.getSingleton(typeof(Villano))
	}
	
	def RepoPaises getRepoPaises() {
		ApplicationContext.instance.getSingleton(typeof(Pais))
	}
	

	def villanoAtrapadoCorrecto() {
		casoActual.orden.villanoConOrden == casoActual.responsable
	}
	
	def generoOrdenDeArresto() {
		casoActual.orden != null
	}
	
	def agregarRecorridoCorrectoIncorrecto() {
			if( !( (casoActual.recorridoCorrecto.contains(casoActual.ubicacionActual) || 
			(casoActual.recorridoIncorrecto.contains(casoActual.ubicacionActual))
		))){
			
			if(casoActual.planDeEscape.contains(casoActual.ubicacionActual)){
				casoActual.recorridoCorrecto.add(casoActual.ubicacionActual)	
			}
			else{
				casoActual.recorridoIncorrecto.add(casoActual.ubicacionActual)
			
			}
		}
	}
	
	def esResponsable(Persona persona) {
		persona == casoActual.responsable
	}
	
	def getLugarDeRobo() {
		casoActual.lugarDeRobo.nombre
	}
	
	def getGetObjetoRobado() {
		casoActual.objetoRobado
	}
	
	def volverUnPaisAtras() {
		casoActual.volverPaisAtras()
	}
	
	def void nuevaUbicacion(Pais pais) {
		casoActual.nuevaUbicacion(pais)
	}
	
	def getResponsable() {
		casoActual.responsable
	}
	
	def getTextoFinal() {
		if (generoOrdenDeArresto){
			 "No generaste orden de arresto " + casoActual.responsable.nombre + "Escapo"
			
			if(villanoAtrapadoCorrecto){
				 "Atrapaste a  " + casoActual.responsable.nombre + " felicidades"
			}
			else{
				 "Tenias orden de arresto a  " + casoActual.orden.villanoConOrden.nombre + " y el responsable era "+ 
				 casoActual.responsable.nombre
			}
		}
		
	}
	
	def getPaisesEnc() {
		val res = new ArrayList<PaisSoloNombreAdapter> 
		generarPaisesEnc(repoPaises.getPaises, res)
	}
	
	def generarPaisesEnc(List<Pais> paises, List<PaisSoloNombreAdapter> res) {
		
		paises.forEach[pais | res.add(new PaisSoloNombreAdapter(pais))]
		res
	}
	
	
	def getCaso(Integer idCaso) {
		return casosDisponibles.findFirst[c | c.id == idCaso]
	}
	
	def getLugar(Caso caso,String string) {
		return caso.lugarDeRobo.lugaresDeInteres.findFirst[l | l.nombre == string]
	}
	
	def viajar(Pais pais) {
		casoActual.nuevaUbicacion(pais)
	}
	
	def adaptarPais(Pais pais) {
		val paisAdapter = new PaisAdapter(pais)
		paisAdapter
	}
	
	def convertirAPais(PaisAdapter adapter) {
		val conexiones = new ArrayList<Pais>
		var conexionesAd = adapter.conexiones
		for(c : conexionesAd){
			conexiones.add(this.repoPaises.search(c.id))
		}
		val lugares = new ArrayList<Lugar>
		for(l : adapter.lugares){
			lugares.add(lugarAPartirDeNombre(l.nombre))
		}
		val pais =new Pais()
		pais.lugares = lugares
		pais.conexiones = conexiones
		pais.nombre = adapter.nombre
		return pais
	}
	
	def lugarAPartirDeNombre(String string) {
		if(string == "Banco"){
			return new Banco()
		}
		if(string == "Club"){
			return new Club()
		}
		if(string == "Embajada"){
			return new Embajada()
		}
		if(string == "Biblioteca"){
			return new Biblioteca()
		}

	}
	
	
	

	
	
}