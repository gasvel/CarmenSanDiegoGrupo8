package adapter

import tp1.Pais
import tp1.Lugar
import java.util.List
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Observable
@Accessors
class PaisAdapter {
	int id
	String nombre
	List<LugarAdapter> lugares
	List<PaisSoloNombreAdapter> conexiones
	
	new(Pais pais){
		id = pais.id
		nombre = pais.nombre
		lugares = adaptarLugares(pais.lugaresDeInteres)
		conexiones = adaptarConexiones(pais.conexiones)
	}
	
	def adaptarLugares(List<Lugar> lugars) {
		val lugaresAdaptados = new ArrayList<LugarAdapter>
		for (i : lugars){
			lugaresAdaptados.add(new LugarAdapter(i))
		}
		return lugaresAdaptados
	}
	
	def adaptarConexiones(List<Pais> paises) {
		val conexionesAdaptadas = new ArrayList<PaisSoloNombreAdapter>
		for (i : paises){
			conexionesAdaptadas.add(new PaisSoloNombreAdapter(i))
		}
		return conexionesAdaptadas
	}
	
}