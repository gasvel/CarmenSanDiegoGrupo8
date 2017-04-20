package appModel

import tp1.Villano
import tp1.CarmenSanDiego
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.model.Entity

@Observable
@Accessors

class AppModelVillano extends Entity {
	
	Villano villano
	CarmenSanDiego model
	String hobbie
	String sena

	new(Villano villanoNuevo, CarmenSanDiego modelo){
		villano = villanoNuevo
		model = modelo		
	}
	
	def agregarSenaActual() {
		villano.senas_particulares.add(sena)
		sena = null
		
		ObservableUtils.firePropertyChanged(villano,"senas_particulares")
	}
	
	def agregarHobbieActual() {
		villano.hobbies.add(hobbie)
		hobbie= null
		
		ObservableUtils.firePropertyChanged(villano,"hobbies")
	}
	
	def nuevoVillano() {
		model.villanos.add(villano)

		ObservableUtils.firePropertyChanged(model,"villanos")	
	}
	
	def actualizarVillanos() {
		model.villanoElegido = villano
		ObservableUtils.firePropertyChanged(model,"villanoElegido")
	}
}