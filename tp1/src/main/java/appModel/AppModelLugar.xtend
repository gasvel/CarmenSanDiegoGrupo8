package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import tp1.Lugar
import appModel.AppModelPartida

@Accessors
@Observable
class AppModelLugar {
	
	Lugar lugar
	AppModelPartida partida
	
	new(Lugar lugarActual, AppModelPartida partidaActual){
		
		lugar = lugarActual
		partida = partidaActual
	}
}