package tp1

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.CollectionBasedRepo
import java.util.List

@Observable
class RepoCasos extends CollectionBasedRepo<Caso>{
	
	def Caso create(Villano villano, List<Pais> plan, Pais lugar,String obj) {
		val caso = new Caso => [
			responsable = villano
			planDeEscape = plan
			lugarDeRobo = lugar
			objetoRobado = obj
			ubicacionActual = lugar
			
		]
		this.create(caso)
		caso
	}
	
	def delete(int id){
		this.delete(this.search(id))
		
	}
	
	
	def List<Caso> getCasos() {
		allInstances	
	}
	

	

	override createExample() {
		new Caso
	}
	


	
	override def update(Caso caso){
		super.update(caso)
	}
	

	

	
	override def Class<Caso> getEntityType() {
		typeof(Caso)
	}
	
	override protected getCriterio(Caso arg0) {
		null
	}
	
	def search(Integer id) {
		casos.findFirst[p| p.id == id]
	}
}
	