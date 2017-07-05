package tp1

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Respuesta {
	
	int id;
	String texto;
	
	new(){
		
	}
	
	new(int idN, String respuesta){
		id = idN
		texto = respuesta
	}
}