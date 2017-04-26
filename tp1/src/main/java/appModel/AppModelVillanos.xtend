package appModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import tp1.Villano
import org.uqbar.commons.utils.ApplicationContext
import tp1.RepoVillanos
import tp1.CarmenSanDiego

@Accessors
@Observable
class AppModelVillanos {
	
	List<Villano> villanos = repoVillanos.getVillanos
	Villano villanoElegido
	CarmenSanDiego juego
	
	new(){
		
	}
	
	new(CarmenSanDiego model){
		juego = model
	}
	
	def nuevaOrdenDeArresto() {
		juego.emitirOrdenDeArresto(villanoElegido)

	}
	
	def RepoVillanos getRepoVillanos() {
		ApplicationContext.instance.getSingleton(typeof(Villano))
	}
	
}