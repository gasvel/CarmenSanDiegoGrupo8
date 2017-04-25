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
		val sena = villano.senas_particulares.get(randomWithRange(villano.senas_particulares.size()-1,0))
		val pais = caso.planDeEscape.last()
		val hobbie = this.darPistaExtra(villano.getHobbies())
		
		val infoPais = pais.caracteristicas.get(randomWithRange(pais.caracteristicas.size()-1,0))
		return("El villano que buscas no esta aqui pero puedo darte informacion" 
			+ "El villano que busca
" + sena + " se encuentra en un pais con esta caracterisca: "+ infoPais + hobbie
		)
	}
	
	def randomWithRange(int min, int max){
			
   		val range = (max - min) + 1  
   		return (((Math.random() * range) + min) as int)
	}
	
	
	def darPistaExtra(List<String> hobbies){
		
		val randomNum = Math.random
		
		if (randomNum < 0.5){
			 
			return "Uno de los hobbies del malhechor es: " + hobbies.get(randomWithRange(hobbies.size()-1,0))
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
		return ("El villano que buscas no esta aqui pero puedo darte informacion  
		" +"Caracteristicas del destino del villano :" + pista1 + " y " + pista2)
		
	}
	
}

class PistaBanco implements Pista{
	
	override darPista(Caso caso){
		val destino = caso.planDeEscape.last()
		val pista1 = destino.caracteristicas.get(0)
		val pista2 = caso.responsable.senas_particulares.get(0)
		return ("Toma pistas papa:" + pista1 + pista2)
	}
}