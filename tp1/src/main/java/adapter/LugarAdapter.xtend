package adapter

import tp1.Lugar
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class LugarAdapter {
	String nombre
	
	new(Lugar lugar){
		nombre = lugar.nombre
	}
}