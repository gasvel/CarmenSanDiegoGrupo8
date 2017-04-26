package tp1

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Caso {
	
	Villano responsable
	List<Pais> planDeEscape
	String objetoRobado
	Pais lugarDeRobo
	

	
	new(Villano villano, List<Pais> plan, Pais lugar, String objetoR){
		responsable = villano
		planDeEscape = plan
		lugarDeRobo = lugar
		objetoRobado = objetoR
	}

}