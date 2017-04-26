package appModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import tp1.Villano
import tp1.OrdenDeArresto
import org.uqbar.commons.utils.ApplicationContext
import tp1.RepoVillanos

@Accessors
@Observable
class AppModelVillanos {
	
	List<Villano> villanos = repoVillanos.getVillanos
	Villano villanoElegido
	AppModelPartida partida
	
	new(){
		
	}
	
	new(AppModelPartida npartida){
		partida = npartida
	}
	
	def nuevaOrdenDeArresto() {
		partida.nuevaOrdenDeArresto(villanoElegido)
		
	}
	
	def RepoVillanos getRepoVillanos() {
		ApplicationContext.instance.getSingleton(typeof(Villano))
	}
	
}