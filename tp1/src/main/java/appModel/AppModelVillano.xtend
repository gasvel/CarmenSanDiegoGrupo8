package appModel

import tp1.Villano
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import tp1.RepoVillanos
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.model.UserException

@Observable
@Accessors

class AppModelVillano {
	
	Villano villano
	String hobbie
	String sena

	new(Villano villanoNuevo){
		villano = villanoNuevo	
	}
	
	def agregarSenaActual() {
		if(!villano.senas_particulares.contains(sena)){
		villano.senas_particulares.add(sena)
		sena = null
		
		ObservableUtils.firePropertyChanged(villano,"senas_particulares")
		
		}
		else{
			throw new UserException("Error:Seña repetida")
		}
	}
	
	def agregarHobbieActual() {
		if(!villano.hobbies.contains(hobbie)){
		villano.hobbies.add(hobbie)
		hobbie= null
		ObservableUtils.firePropertyChanged(villano,"hobbies")
		
		}
		else{
			throw new UserException("Error:Hobbie repetido")
		}
	}
	
	def nuevoVillano() {
		if(!repoVillanos.getVillanos.contains(villano) ){
			repoVillanos.create(villano)
			ObservableUtils.firePropertyChanged(repoVillanos,"villanos")
		}
		else{
			throw new UserException("Villano ya existente")
		}
	}
	
	def actualizarVillanos() {
		
		repoVillanos.update(villano)
		ObservableUtils.firePropertyChanged(repoVillanos,"villanos")
	}
	
	def RepoVillanos getRepoVillanos(){
		ApplicationContext.instance.getSingleton(typeof(Villano))
	}
}