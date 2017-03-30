package tp1

class Cuidador extends Persona {
	
	new(String nombreP) {
		super(nombreP)
	}
	
	override darInfo(Pista pista, Caso caso){
		return("Quien te conoce Boludo? Tomatela te dije!")
	}
}