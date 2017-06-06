package tp1


import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity
import adapter.PistaAdapter

@Observable
@Accessors
class Lugar extends Entity {
	String nombre
	
	
	new(){
		
	}
	
	def getNombre(){
		nombre
	}
	
	def darInfo(Pista pista,Caso caso){
		caso.agregarRecorridoCorrectoIncorrecto
		
		if(!caso.ubicacionEnPlanDeEscape()){
			return new PistaAdapter("Quien te conoce boludo! Tomatela te dije!");
		}
		else{
			if(caso.esPaisFinal()){
				if(nombre == caso.ubicacionActual.lugarVillano.nombre){
					new PistaAdapter(caso.getTextoFinal());
				}
				else{
					return new PistaAdapter("It's a trap!!");
				}
			}
			else{
				new PistaAdapter(pista.darPista(caso));
			}
		}
	}

	
	def obtenerPista(Caso caso){
		
	}



}

class Club extends Lugar{
	
	new(){
		nombre = "Club"
	}
	override obtenerPista(Caso caso){
		val pista = new PistaClub
		darInfo(pista,caso)
	}
	
		

	override toString(){
		"Club"
	}
}

class Biblioteca extends Lugar {
	
	new(){
		nombre = "Biblioteca"
	}
	
	override obtenerPista(Caso caso){
		val pista = new PistaBiblioteca
		darInfo(pista,caso)
	}

	
	override toString(){
		"Biblioteca"
	}
}


class Embajada extends Lugar {

	new(){
		nombre = "Embajada"
	}
	override obtenerPista(Caso caso){
		val pista = new PistaEmbajada
		darInfo(pista,caso)
	}
	

	
	override toString(){
		"Embajada"
	}
}


class Banco extends Lugar {
	
	new(){
		nombre = "Banco"
	}
	override obtenerPista(Caso caso){
		val pista = new PistaBanco
		this.darInfo(pista,caso)
	}
	
	
	

	
	override toString(){
		"Banco"
	}
	
}