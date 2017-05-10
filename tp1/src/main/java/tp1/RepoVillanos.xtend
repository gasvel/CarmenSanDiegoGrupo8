package tp1

import org.uqbar.commons.model.CollectionBasedRepo
import java.util.List
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.UserException

@Observable
class RepoVillanos extends CollectionBasedRepo<Villano> {
	
	def Villano create(String nombreVillano,String sexoVillano, List<String> senasVillano,List<String> hobbiesVillano){
		val villano = new Villano => [	
			nombre = nombreVillano
			sexo = sexoVillano
			senas_particulares = senasVillano
			hobbies = hobbiesVillano
			
		]
		this.create(villano)
		villano
	}
	
	override void validateCreate(Villano villano){
		villano.validar()
		validarVillanoConNombreRepetido(villano)
	}
	
	def validarVillanoConNombreRepetido(Villano villano) {

		val nombre = villano.nombre
		if (! (this.get(nombre) == null)) {
			throw new UserException("Ya existe un villano con el nombre: " + nombre)
		}
	}
	
	def get(String nombreVillano){
		villanos.findFirst [ villano | villano.nombre.equals(nombreVillano) ]
	}
	
	def getVillanos(){
		allInstances
	}
	
	override protected getCriterio(Villano arg0) {
		null
	}
	
	override def update(Villano villano){
		villano.validar
		super.update(villano)
	}
	
	override createExample() {
		new Villano
	}
	
	override def Class<Villano> getEntityType() {
		typeof(Villano)
	}
	
	def Villano search(Integer id) {
		villanos.findFirst[v | v.id == id]
	}
	

	

	
}