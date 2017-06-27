package adapter

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class PistaAdapter {
	
	String pista;
	
	new (String pistaObtenida){
		pista = pistaObtenida;
	}
	
	new(){
		
	}
}