package tp1

class Informante extends Persona {


	
	override darInfo(Pista pista, Caso caso){
		return(pista.darPista(caso))	
	}
	
	override toString(){
		"Informante"
	}
}

