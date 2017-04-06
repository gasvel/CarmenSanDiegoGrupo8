package tp1

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable


@Observable
@Accessors


class Pais {
	String nombre;
	List<String> caracteristicas;
	List<Lugar> lugaresDeInteres;
	List<Pais> conexiones;
	
	new(String nombreP, List<String> caracteristicasP, List<Lugar> lugares, List<Pais> paises){
		nombre = nombreP
		caracteristicas = caracteristicasP
		lugaresDeInteres = lugares
		conexiones = paises
	}
	
	def getCaracteristicas(){
		caracteristicas
	}
	
	def getNombre(){
		nombre
	}
	
	override toString(){
		getNombre
	}
	
}