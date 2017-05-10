package tp1

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.uqbar.commons.utils.Observable
import excepciones.VillanoInvalidoException

@Observable
@Accessors
class Villano extends Persona {
	
	String nombre;
	String sexo;
	List<String> senas_particulares;
	List<String> hobbies;
	
	new(){
		senas_particulares = new ArrayList<String>
		hobbies = new ArrayList<String>
	}
	
	new(String nombreV,String sexoV, List<String> senas, List<String> hobbiesV){
		nombre = nombreV
		sexo = sexoV
		senas_particulares = senas
		hobbies = hobbiesV
	}
	
	override darInfo(Pista pista, Caso caso){
		"ALTO! Detengase: " + nombre
	}
	
	def validar() {
		if(!esVillanoValido){
			throw new VillanoInvalidoException("El villano tiene que nombre, sexo y la cantidad de señas y hobbies debe ser mayor a 2")
		}
	}
	
	def getNombre(){
		nombre
	}
	
	private def boolean tieneNombreValido(){
		!nombre.isNullOrEmpty
	}
	
	private def boolean tieneSexoValido(){
		!sexo.isNullOrEmpty
	}
	
	private def boolean tieneSeniasValido(){
		senas_particulares.size >= 2
	}
	
	private def boolean tieneHobbiesValido(){
		hobbies.size >=2
	}
	
	def boolean esVillanoValido(){
		tieneNombreValido && tieneSexoValido && tieneSeniasValido && tieneHobbiesValido
	}
	
	def copiarDatos(Villano villano) {
		nombre = villano.nombre
		sexo = villano.sexo
		senas_particulares = villano.senas_particulares
		hobbies = villano.hobbies
	}
	
}