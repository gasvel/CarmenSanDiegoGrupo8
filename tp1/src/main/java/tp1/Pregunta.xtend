package tp1

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity

@Accessors

class Pregunta extends Entity{
	
	String texto;
	List<Respuesta> respuestas;
	int idCorrecta;
	String categoria;
	
	new(){
		
	}
	
	new(String pregunta ,List<Respuesta> lista,int id , String cat){
		texto = pregunta
		respuestas = lista
		idCorrecta = id
		categoria = cat
	}
}