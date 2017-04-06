package tp1

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors

class Villano extends Persona {
	
	String nombre;
	String sexo;
	List<String> senas_particulares;
	List<String> hobbies;
	
	new(String nombreV){
		super(nombreV)
	}
	
	new( String nombreV,String sexoV, List<String> senas, List<String> hobbiesV){
		this(nombreV)
		nombre = nombreV
		sexo = sexoV
		senas_particulares = senas
		hobbies = hobbiesV
	}
	
	def getSexo(){
		sexo
	}
	
	def getSenas(){
		senas_particulares
	}
	
	def getHobbies() {
		hobbies
	}
	
	override toString(){
		nombre
	}
	
	override darInfo(Pista pista, Caso caso){
		
		return ("Atrapaste al malvado villano!")
	}
}