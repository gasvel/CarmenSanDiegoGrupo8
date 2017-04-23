package tp1

class Lugar {
	
	public Persona ocupante;
	
	new(){
		
	}

	
	def obtenerPista(Caso caso){
		
	}
	
	def setOcupante(Persona nuevoOcupante){
		ocupante = nuevoOcupante
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