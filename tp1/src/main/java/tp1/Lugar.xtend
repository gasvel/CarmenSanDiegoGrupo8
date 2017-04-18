package tp1

class Lugar {
	
	public Persona ocupante;
	
	new(Persona ocupanteLugar){
		ocupante = ocupanteLugar
	}
	
	def obtenerPista(Caso caso){
		
	}
}

class Biblioteca extends Lugar {
	
	new(Persona ocupanteLugar) {
		super(ocupanteLugar)
	}
	
	override obtenerPista(Caso caso){
		val pista = new PistaBiblioteca
		ocupante.darInfo(pista,caso)
	}
	
	override toString(){
		"Biblioteca"
	}
}


class Embajada extends Lugar {

	new(Persona ocupanteLugar){
		super(ocupanteLugar)
	}
	
	override obtenerPista(Caso caso){
		val pista = new PistaEmbajada
		ocupante.darInfo(pista,caso)
	}
	
	override toString(){
		"Embajada"
	}
}


class Banco extends Lugar {
	new(Persona ocupanteLugar){
		super(ocupanteLugar)
	}
	
	override obtenerPista(Caso caso){
		val pista = new PistaBanco
		ocupante.darInfo(pista,caso)
	}
	
	override toString(){
		"Banco"
	}
}