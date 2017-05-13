package appModel

import tp1.Villano
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.model.UserException
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AppModelEditarSeniasVillano {
		
	Villano villano
	String sena
	
	def agregarSenaActual() {
		if(!villano.senas_particulares.contains(sena)){
			villano.senas_particulares.add(sena)
			sena = null
		
			ObservableUtils.firePropertyChanged(villano,"senas_particulares")
		} else {
			throw new UserException("Error:Seña repetida")
		}
	}
}