package tp1

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import appModel.AppModelPartida
import tp1.RepoPaises
import org.uqbar.commons.utils.ApplicationContext
import java.util.List

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

	
	
	new(){
		
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
		recorrido.add(ubicacionActual)
	}
	
	def generarPartida() {
		val generador = new GeneradorDeCasos()
		casosDisponibles = generador.generarCasosDisponibles(3)
		casoActual = generador.obtenerCaso()
		generador.asignarCuidadores(this.repoPaises.getPaises())
		generador.asignarOcupantes(casoActual.planDeEscape, casoActual.responsable)
		
		ubicacionActual = casoActual.paisDeInicio
		
		actualizarLugares(ubicacionActual)
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
			if( !( (recorridoCorrecto.contains(ubicacionActual) || 
			(recorridoIncorrecto.contains(ubicacionActual))
		))){
			
			if(casoActual.planDeEscape.contains(ubicacionActual)){
				recorridoCorrecto.add(ubicacionActual)	
			}
			else{
				recorridoIncorrecto.add(ubicacionActual)
			
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
		val res = new ArrayList<PaisEncapsulado> 
		generarPaisesEnc(repoPaises.getPaises, res)
	}
	
	def generarPaisesEnc(List<Pais> paises, List<PaisEncapsulado> res) {
		
		paises.forEach[pais | res.add(new PaisEncapsulado(pais.nombre, pais.id))]
		res
	}
	
	def getPais(Integer integer) {
		val pais = repoPaises.getPaises.findFirst[ it.id == integer]
		val conexEnc = new ArrayList<PaisEncapsulado> 
		pais.conexiones = (generarPaisesEnc(pais.getConexiones,conexEnc) as List<Pais>)
	}
	

	
	
}