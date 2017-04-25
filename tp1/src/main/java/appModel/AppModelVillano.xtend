package appModel

import tp1.Villano
import tp1.CarmenSanDiego
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.model.Entity
import tp1.RepoVillanos
import org.uqbar.commons.utils.ApplicationContext

@Observable
@Accessors

class AppModelVillano extends Entity {
	
	Villano villano
	String hobbie
	String sena

	new(Villano villanoNuevo){
		villano = villanoNuevo
	
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

		ObservableUtils.firePropertyChanged(this,"villano")	
	}
	
	def actualizarVillanos() {
		repoVillanos.update(villano)
		ObservableUtils.firePropertyChanged(this,"villano")
	}
	
	def RepoVillanos getRepoVillanos(){
		ApplicationContext.instance.getSingleton(typeof(Villano))
	}
}