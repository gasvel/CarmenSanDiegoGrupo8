package tp1

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AppModelPartida{
	
	CarmenSanDiego model
	Caso casoActual
	Pais ubicacionActual
	List<Pais> recorridoCorrecto = new ArrayList<Pais>
	List<Pais> recorridoIncorrecto = new ArrayList<Pais>
	
	
	new(CarmenSanDiego modelo, Caso caso, Pais paisDeInicio){
		model = modelo
		casoActual = caso
		ubicacionActual = paisDeInicio
	}
	
	
}