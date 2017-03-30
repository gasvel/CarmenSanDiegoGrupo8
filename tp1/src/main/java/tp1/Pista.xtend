package tp1

import java.util.List

interface Pista {
	


	
	def darPista(Caso caso){
		
	}
}

class PistaBiblioteca implements Pista{
	
	@Override
	override darPista(Caso caso){
		val villano = caso.getResponsable()
		val senal = villano.senas.get(0)
		val pais = caso.planDeEscape.last()
		val hobbie = this.darPistaExtra(villano.getHobbies())
		
		val infoPais = pais.caracteristicas.get(0)
		return("El villano que buscas no esta aqui pero puedo darte informacion" + senal + infoPais + hobbie)
	}
	
	def darPistaExtra(List<String> hobbies){
		
		val randomNum = Math.random
		
		if (randomNum < 0.5){
			return hobbies.get(0)
		}
		else{
			return("")
		}
	}
}


class PistaEmbajada implements Pista {
	
	override darPista(Caso caso){
		val destino = caso.planDeEscape.last()
		val pista1 = destino.caracteristicas.get(0)
		val pista2 = destino.caracteristicas.get(1)
		return ("El villano que buscas no esta aqui pero puedo darte informacion" + pista1 + pista2)
	}
}

class PistaBanco implements Pista{
	
	override darPista(Caso caso){
		val destino = caso.planDeEscape.last()
		val pista1 = destino.caracteristicas.get(0)
		val pista2 = caso.responsable.senas.get(0)
		return ("Toma pistas papa:" + pista1 + pista2)
	}

}




