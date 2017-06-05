package appModel

import tp1.Villano
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.model.UserException
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AppModelEditarHobbiesVillano {
	Villano villano
	String hobbie
	
	def agregarHobbieActual() {
		if(!villano.hobbies.contains(hobbie)){
			villano.hobbies.add(hobbie)
			hobbie= null
			
			ObservableUtils.firePropertyChanged(villano,"hobbies")
		} else {
			throw new UserException("Error:Hobbie repetido")
		}
	}
}