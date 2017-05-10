package adapter

import tp1.Caso
import tp1.Pais
import java.util.List
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class CasoAdapter {
	
	int id 
	PaisAdapter pais
	List<Pais> paisesVisitados
	List<Pais> paisesFallidos
	
	new(Caso caso){
		id = caso.id
		pais = new PaisAdapter(caso.lugarDeRobo)
		paisesVisitados = caso.recorrido
		paisesFallidos = caso.recorridoIncorrecto
	}
}