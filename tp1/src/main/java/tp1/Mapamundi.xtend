package tp1

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List
import excepciones.PaisRepetidoException

@Accessors
@Observable
class Mapamundi {
	
	List<Pais> paises
	
	new() { 
		paises = newArrayList()
	}
	
	def getAll() {
		paises
	}
	
	def int size(){
		paises.size
	}
	
	def agregarPais(Pais pais) {
		if(!paisRepetido(pais)){
			paises.add(pais)
			} else{
				throw new PaisRepetidoException("El país que quiere ingresar ya se encuentra en el mapamundi")
			}
	}
	
	private def boolean paisRepetido(Pais pais){
		paises.filter[p | p.nombre == pais.nombre].size > 0
	}
	
	def eliminarPais(Pais pais){
		paises.remove(pais)
	}
}