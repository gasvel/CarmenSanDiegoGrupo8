package appModel

import tp1.Pais
import tp1.RepoPaises
import java.util.List
import org.uqbar.commons.utils.ApplicationContext
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable
class AppModelMapamundi {
	
	
	Pais paisSeleccionado
	List<Pais> paises = repoPaises.getPaises
	
	def eliminarPaisSeleccionado() {
		repoPaises.delete(paisSeleccionado)
		ObservableUtils.firePropertyChanged(this, "paises")
	}
	
	def RepoPaises getRepoPaises() {
		ApplicationContext.instance.getSingleton(typeof(Pais))
	}
	
}