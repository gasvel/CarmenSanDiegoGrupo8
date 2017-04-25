package tp1

import org.uqbar.commons.model.CollectionBasedRepo
import java.util.List
import org.uqbar.commons.utils.Observable

@Observable
class RepoPaises extends CollectionBasedRepo<Pais>{
	
	def Pais create(String nombrePais, List<String> caracteristicasPais, List<Lugar> lugares) {
		val pais = new Pais => [
			nombre = nombrePais
			caracteristicas = caracteristicasPais
			lugaresDeInteres = lugares
			
		]
		this.create(pais)
		pais
	}
	
	def delete(String nombre){
		this.delete(get(nombre))
		
	}
	
	
	def List<Pais> getPaises() {
		allInstances	
	}
	
	def addConexion(String nombre,Pais pais){
		get(nombre).conexiones.add(pais)
	}
	
	def Pais get(String nombrePais) {
		paises.findFirst [ pais | pais.nombre.equals(nombrePais) ]
	}
	
	override createExample() {
		new Pais
	}
	
	def filterPaises(List<Pais> paises){
		paises.filter[pais | !paises.contains(pais)].toList()
	}
	
	override def Class<Pais> getEntityType() {
		typeof(Pais)
	}
	
	override protected getCriterio(Pais arg0) {
		null
	}
	
}