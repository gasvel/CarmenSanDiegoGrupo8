package tp1

import java.util.List

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
}