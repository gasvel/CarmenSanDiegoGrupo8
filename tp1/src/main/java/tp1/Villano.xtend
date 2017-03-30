package tp1

import java.util.List

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
	
	def getSenas(){
		senas_particulares
	}
	
	def getHobbies() {
		hobbies
	}
	
	override darInfo(Pista pista, Caso caso){
		
		return ("Atrapaste al malvado villano!")
	}
}