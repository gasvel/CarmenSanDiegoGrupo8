package tp1

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
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
	
	new() {
	}
	
	def setLugares(ArrayList<Lugar> lugares){
		lugaresDeInteres = lugares
	}
	
	def nuevoInformante(){
		lugaresDeInteres.forEach[setOcupante(new Informante())]
	}
	
	def nuevoCuidador(){
		lugaresDeInteres.forEach[setOcupante(new Cuidador())]
	}
	
	def nuevoVillano(Villano responsable){
		lugaresDeInteres.forEach[setOcupante(new InformanteFinal())]
		val ubicacionVillano = (lugaresDeInteres.last())
		ubicacionVillano.setOcupante(responsable)
		lugaresDeInteres.remove(lugaresDeInteres.last())
		lugaresDeInteres.add(ubicacionVillano)
	}
	

}