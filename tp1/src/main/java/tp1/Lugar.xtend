package tp1

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity

@Observable
@Accessors
class Lugar extends Entity {
	
	public Persona ocupante;
	new(){
		
	}

	
	def obtenerPista(Caso caso){
		
	}
	
	def setOcupante(Persona nuevoOcupante){
		ocupante = nuevoOcupante
	}
}

class Club extends Lugar{
	override obtenerPista(Caso caso){
		val pista = new PistaClub
		ocupante.darInfo(pista,caso)
	}
	
	override toString(){
		"Club"
	}
}

class Biblioteca extends Lugar {
	

	
	override obtenerPista(Caso caso){
		val pista = new PistaBiblioteca
		ocupante.darInfo(pista,caso)
	}
	
	override toString(){
		"Biblioteca"
	}
}


class Embajada extends Lugar {


	override obtenerPista(Caso caso){
		val pista = new PistaEmbajada
		ocupante.darInfo(pista,caso)
	}
	
	override toString(){
		"Embajada"
	}
}


class Banco extends Lugar {

	override obtenerPista(Caso caso){
		val pista = new PistaBanco
		ocupante.darInfo(pista,caso)
	}
	
	override toString(){
		"Banco"
	}
}