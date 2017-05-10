package adapter

import tp1.Caso
import tp1.Pais
import java.util.List
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Observable
@Accessors
class CasoAdapter {
	
	int id 
	PaisAdapter pais
	List<PaisSoloNombreAdapter> paisesVisitados
	List<PaisSoloNombreAdapter> paisesFallidos
	
	new(Caso caso){
		id = caso.id
		pais = new PaisAdapter(caso.lugarDeRobo)
		paisesVisitados = adaptarPaises(caso.recorrido)
		paisesFallidos = adaptarPaises(caso.recorridoIncorrecto)
	}
	
	def adaptarPaises(List<Pais> paises){
		val paisesAdaptados = new ArrayList<PaisSoloNombreAdapter>
		for(p : paises){
			paisesAdaptados.add(new PaisSoloNombreAdapter(p))
		}
		return paisesAdaptados
	}
}