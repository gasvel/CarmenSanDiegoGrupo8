package adapter

import tp1.Pais
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class PaisSoloNombreAdapter {
	
	int id
	String nombre
	
	new(){
		
	}
	
	new(Pais pais){
		id = pais.id
		nombre = pais.nombre
	}
}