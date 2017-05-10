package tp1

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.ArrayList

@Accessors
@Observable
class Caso{
	
	int id
	Villano responsable
	List<Pais> planDeEscape
	String objetoRobado
	Pais lugarDeRobo
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

}