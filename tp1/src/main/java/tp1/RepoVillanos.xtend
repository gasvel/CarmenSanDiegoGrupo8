package tp1

import org.uqbar.commons.model.CollectionBasedRepo
import java.util.List
import org.uqbar.commons.utils.Observable

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
	
	def getVillanos(){
		allInstances
	}
	
	override protected getCriterio(Villano arg0) {
		null
	}
	
	override createExample() {
		new Villano
	}
	
	override def Class<Villano> getEntityType() {
		typeof(Villano)
	}
	
}