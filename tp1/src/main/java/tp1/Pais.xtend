package tp1

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity

@Observable
@Accessors
class Pais extends Entity{
	String nombre;
	List<String> caracteristicas;
	List<Lugar> lugaresDeInteres;
	List<Pais> conexiones = new ArrayList<Pais>
	
	new(String nombreP, List<String> caracteristicasP, List<Lugar> lugares){
		nombre = nombreP
		caracteristicas = caracteristicasP
		lugaresDeInteres = lugares

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
		
	}
	

}