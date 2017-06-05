package tp1

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class OrdenDeArresto {
	
	Villano villanoConOrden
	
	new(Villano villano){
		villanoConOrden = villano
	}
}