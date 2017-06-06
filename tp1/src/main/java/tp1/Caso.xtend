package tp1

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.ArrayList
import excepciones.NoPuedeViajarPaisFueraDeLaConexionException

@Accessors
@Observable
class Caso{
	
	int id
	Lugar lugar1
	Lugar lugar2
	Lugar lugar3
	Villano responsable
	List<Pais> planDeEscape
	String objetoRobado
	Pais lugarDeRobo
	Pais ubicacionActual
	List<Pais> recorrido = new ArrayList<Pais>
	List<Pais> recorridoCorrecto = new ArrayList<Pais>
	List<Pais> recorridoIncorrecto = new ArrayList<Pais>
	OrdenDeArresto orden
	

	
	new(int idC,Villano villano, List<Pais> plan, Pais lugar, String objetoR){
		id = idC
		responsable = villano
		planDeEscape = plan
		lugarDeRobo = lugar
		objetoRobado = objetoR
		ubicacionActual = lugar
	}
	
	def agregarRecorridoCorrectoIncorrecto() {
			if( !( (recorridoCorrecto.contains(ubicacionActual) || 
			(recorridoIncorrecto.contains(ubicacionActual))
		))){
			
			if(planDeEscape.contains(ubicacionActual)){
				recorridoCorrecto.add(ubicacionActual)	
			}
			else{
				recorridoIncorrecto.add(ubicacionActual)
			
			}
		}
	}
	
	def getResponsable() {
		responsable
	}
	
	def getPaisDeInicio() {
		lugarDeRobo
	}
	
	def emitirOrdenDeArresto(Villano villano) {
		orden = new OrdenDeArresto(villano)
	}
	
	def getLugar(String string) {
		return ubicacionActual.lugaresDeInteres.findFirst[l | l.nombre == string]
	}
	
	def volverPaisAtras() {
		ubicacionActual = recorrido.last()
	}
	
	def nuevaUbicacion(Pais pais) throws NoPuedeViajarPaisFueraDeLaConexionException{
		
			
			if(ubicacionActual.conexiones.contains(pais)){
				actualizarRecorrido(ubicacionActual)
				
				ubicacionActual = pais
				actualizarLugares(ubicacionActual)
				ubicacionActual.generarLugarVillano()
			}
			else{
				if(pais.nombre == recorrido.last().nombre){
					volverPaisAtras()
			
				}else{
					throw new NoPuedeViajarPaisFueraDeLaConexionException("No te pases de listo chaval que no puedes viajar ahi")
				}
			
			}
	}
	
	
	
	def actualizarLugares(Pais pais) {
		lugar1 = ubicacionActual.lugaresDeInteres.get(0)
		lugar2 = ubicacionActual.lugaresDeInteres.get(1)
		lugar3 = ubicacionActual.lugaresDeInteres.get(2)
		
		
	}
	
	def actualizarRecorrido(Pais pais) {
	
		recorrido.add(pais)
	}
	
	def getOrdenDeArresto() {
		orden
	}
	
	def ubicacionEnPlanDeEscape() {
		return planDeEscape.contains(ubicacionActual)
	}
	
	def esPaisFinal() {
		return ubicacionActual == planDeEscape.last()
	}
	
	
	def villanoAtrapadoCorrecto() {
		orden.villanoConOrden == responsable
	}
	
	def generoOrdenDeArresto() {
		orden != null
	}
	
	def getTextoFinal() {
		if (generoOrdenDeArresto){
			
			if(villanoAtrapadoCorrecto){
				 "Atrapaste a  " + responsable.nombre + " felicidades"
			}
			else{
				 "Tenias orden de arresto a  " + orden.villanoConOrden.nombre + " y el responsable era "+ 
				 responsable.nombre
			}
		}
		else{
			"No generaste orden de arresto " + responsable.nombre + "Escapo"
			
		}

		
	}
	


}