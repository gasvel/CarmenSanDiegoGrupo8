package tp1

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List

@Accessors
@Observable
class Mapamundi {
	
	List<Pais> paises
	
	new() { 
		paises = newArrayList()
	}
	
	def agregarPais(Pais pais) {
		paises.add(pais)
	}
	
	def eliminarPais(Pais pais){
		paises.remove(pais)
	}
}