package appModel

import tp1.Villano
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import tp1.RepoVillanos
import org.uqbar.commons.utils.ApplicationContext

@Observable
@Accessors

class AppModelVillano {
	
	Villano villano
	String hobbie
	String sena
	AppModelVillanos listVillanos

	new(Villano villanoNuevo, AppModelVillanos model){
		villano = villanoNuevo
		listVillanos = model
	
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
		repoVillanos.create(villano)

		ObservableUtils.firePropertyChanged(listVillanos,"villanos")	
	}
	
	def actualizarVillanos() {
		repoVillanos.update(villano)
		ObservableUtils.firePropertyChanged(listVillanos,"villanos")
	}
	
	def RepoVillanos getRepoVillanos(){
		ApplicationContext.instance.getSingleton(typeof(Villano))
	}
}