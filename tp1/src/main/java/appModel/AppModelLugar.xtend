package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import tp1.Lugar
import appModel.AppModelPartida

@Accessors
@Observable
class AppModelLugar {
	
	Lugar lugar
	
	new(Lugar lugarActual){
		
		lugar = lugarActual
	}
	
	
}