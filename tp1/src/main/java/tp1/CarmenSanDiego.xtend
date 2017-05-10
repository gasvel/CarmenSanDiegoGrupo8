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
	Lugar lugar1
	Lugar lugar2
	Lugar lugar3
	List<Pais> recorridoCorrecto = new ArrayList<Pais>
	List<Pais> recorridoIncorrecto = new ArrayList<Pais>
	List<Pais> recorrido = new ArrayList<Pais>
	OrdenDeArresto ordenDeArresto
	Pais ubicacionActual
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
	
	def actualizarLugares(Pais ubicacionActual){
		lugar1 = ubicacionActual.lugaresDeInteres.get(0)
		lugar2 = ubicacionActual.lugaresDeInteres.get(1)
		lugar3 = ubicacionActual.lugaresDeInteres.get(2)
		
		}
	
	def actualizarRecorrido(Pais ubicacionActual){
		casoActual.recorrido.add(ubicacionActual)
	}
	
	def generarPartida() {
		val generador = new GeneradorDeCasos()
		casoActual = generador.obtenerCaso()
		val paises = new ArrayList<Pais>
		val plan = new ArrayList<Pais>
		paises.addAll(this.repoPaises.getPaises())
		plan.addAll(casoActual.planDeEscape)
		generador.asignarCuidadores(paises)
		generador.asignarOcupantes(plan, casoActual.responsable)
		
		ubicacionActual = casoActual.paisDeInicio
		
		actualizarLugares(ubicacionActual)
	}
	
	
	
	def RepoVillanos getRepoVillanos(){
		ApplicationContext.instance.getSingleton(typeof(Villano))
	}
	
	def RepoPaises getRepoPaises() {
		ApplicationContext.instance.getSingleton(typeof(Pais))
	}
	
	def emitirOrdenDeArresto(Villano villano) {
		ordenDeArresto = new OrdenDeArresto(villano)
	}
	
	def villanoAtrapadoCorrecto() {
		ordenDeArresto.villanoConOrden == casoActual.responsable
	}
	
	def generoOrdenDeArresto() {
		ordenDeArresto != null
	}
	
	def agregarRecorridoCorrectoIncorrecto() {
			if( !( (casoActual.recorridoCorrecto.contains(ubicacionActual) || 
			(casoActual.recorridoIncorrecto.contains(ubicacionActual))
		))){
			
			if(casoActual.planDeEscape.contains(ubicacionActual)){
				casoActual.recorridoCorrecto.add(ubicacionActual)	
			}
			else{
				casoActual.recorridoIncorrecto.add(ubicacionActual)
			
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
		ubicacionActual = recorrido.last()
	}
	
	def nuevaUbicacion(Pais pais) {
		ubicacionActual = pais
		actualizarRecorrido(ubicacionActual)
		actualizarLugares(ubicacionActual)	}
	
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
				 "Tenias orden de arresto a  " + ordenDeArresto.villanoConOrden.nombre + " y el responsable era "+ 
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
	
	def getPais(Integer integer) {
		val pais = repoPaises.getPaises.findFirst[ it.id == integer]
		val paisAdapter = new PaisAdapter(pais) 
		paisAdapter
	}
	
	def getCaso(Integer idCaso) {
		return casosDisponibles.findFirst[c | c.id == idCaso]
	}
	
	def getLugar(Caso caso,String string) {
		return caso.lugarDeRobo.lugaresDeInteres.findFirst[l | l.nombre == string]

	}
	

	
	
}