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
		return(this.ocupante.darInfo(pista,caso))
	}
}

class Embajada extends Lugar {

	new(Persona ocupanteLugar){
		super(ocupanteLugar)
	}
	
	override obtenerPista(Caso caso){
		val pista = new PistaEmbajada
		return(this.ocupante.darInfo(pista,caso))
	}
}


class Banco extends Lugar {
	new(Persona ocupanteLugar){
		super(ocupanteLugar)
	}
	
	override obtenerPista(Caso caso){
		val pista = new PistaBanco
		return(this.ocupante.darInfo(pista,caso))
	}
}



