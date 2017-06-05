package tp1

import org.uqbar.commons.model.CollectionBasedRepo
import java.util.List
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.UserException

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
	
	override validateCreate(Pais pais){
		//pais.validar()
		validarPaisRepetido(pais)
	}
	
	def validarPaisRepetido(Pais pais) {
		val nombre = pais.nombre
		if (! (this.get(nombre) == null)) {
			throw new UserException("Ya existe un pais con el nombre: " + nombre)
		}
	}
	
	override def update(Pais pais){
		//pais.validar
		validarConexiones(pais)
		super.update(pais)
	}
	
	def validarConexiones(Pais pais) {
		if(pais.conexiones.size() == 0){
			throw new UserException("El pais debe tener al menos una conexion con otro pais")
		}
	}
	

	
	override def Class<Pais> getEntityType() {
		typeof(Pais)
	}
	
	override protected getCriterio(Pais arg0) {
		null
	}
	
	def search(Integer id) {
		paises.findFirst[p| p.id == id]
	}
	
}