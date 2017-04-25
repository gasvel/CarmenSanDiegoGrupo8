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
	OrdenDeArresto ordenDeArresto
	Villano villanoElegido
	
	
	
	def nuevaOrdenDeArresto() {
		ordenDeArresto = new OrdenDeArresto(villanoElegido)
	}
	
	def RepoVillanos getRepoVillanos() {
		ApplicationContext.instance.getSingleton(typeof(Villano))
	}
	
}