package tp1

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.UserException

@Observable
@Accessors
class Pais extends Entity{
	String nombre;
	List<String> caracteristicas;
	List<Lugar> lugaresDeInteres = new ArrayList<Lugar>
	List<Pais> conexiones = new ArrayList<Pais>
	Lugar lugarVillano
	
	new(String nombreP, List<String> caracteristicasP, List<Lugar> lugares){
		nombre = nombreP
		caracteristicas = caracteristicasP
		lugaresDeInteres.addAll(lugares)

	}
	
	new() {
	}
	
	def setLugares(ArrayList<Lugar> lugares){
		lugaresDeInteres = lugares
	}
	

	
	def getNombre() {
		nombre
	}
	
	def copiarDatos(Pais pais) {
		lugaresDeInteres= pais.lugaresDeInteres
		nombre = pais.nombre
		conexiones = pais.conexiones
		
	}
	
	def randomWithRange(int min, int max){
   		val range = (max - min) + 1  
   		return (((Math.random() * range) + min) as int)
	}
	
	def generarLugarVillano() {
		val num = randomWithRange(0,2)
		lugarVillano = lugaresDeInteres.get(num)
	}
	
	/*def validar() {
		
		if(caracteristicas.size()<2){
			throw new UserException("La cantidad de caracteristicas debe ser al menos 2")
		}
		if(lugaresDeInteres.size()!= 3){
			throw new UserException("El pais debe tener exactamente 3 lugares")
		}

		
	}*/
	

}