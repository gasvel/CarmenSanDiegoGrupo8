package tp1

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.ArrayList

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
	

	
	new( String nombreV,String sexoV, List<String> senas, List<String> hobbiesV){
		
		nombre = nombreV
		sexo = sexoV
		senas_particulares = senas
		hobbies = hobbiesV
	}
		
	override toString(){
		this.nombre
	}
	
	override darInfo(Pista pista, Caso caso){
		"Atrapaste al malvado villano!"
	}
}