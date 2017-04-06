package tp1

class Informante extends Persona {

	new(String nombreP) {
		super(nombreP)
	}
	
	override darInfo(Pista pista, Caso caso){
		return(pista.darPista(caso))	
	}
}

