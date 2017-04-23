package appModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import tp1.Villano
import tp1.OrdenDeArresto

@Accessors
@Observable
class AppModelVillanos {
	
	List<Villano> villanos
	OrdenDeArresto ordenDeArresto
	Villano villanoElegido
	
	new( List<Villano> villanosDisponibles){
		villanos = villanosDisponibles
	}
	
	def nuevaOrdenDeArresto() {
		ordenDeArresto = new OrdenDeArresto(villanoElegido)
	}
	
}