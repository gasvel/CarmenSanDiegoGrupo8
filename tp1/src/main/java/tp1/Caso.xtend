package tp1

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.ArrayList

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
	
	def nuevaUbicacion(Pais pais){
		ubicacionActual = pais
		actualizarRecorrido(ubicacionActual)
		actualizarLugares(ubicacionActual)
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

}