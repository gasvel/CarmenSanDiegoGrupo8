package tp1

import java.util.List

interface Pista {
	
	def randomWithRange(int min, int max){
			
   		val range = (max - min) + 1  
   		return (((Math.random() * range) + min) as int)
	}
	
	def darPista(Caso caso){
		
	}
	
	def darPistaExtra(List<String> hobbies, double posibilidad){
		
		val randomNum = Math.random
		
		if (randomNum < posibilidad){
			 
			return ". Uno de los hobbies del malhechor es: " + hobbies.get(randomWithRange(hobbies.size()-1,0))
		}
		else{
			return("")
		}
	}
}

class PistaBiblioteca implements Pista{
	
	@Override
	override darPista(Caso caso){
		val villano = caso.getResponsable()
		val sena = villano.senas_particulares.get(randomWithRange(0,villano.senas_particulares.size()-1))
		val pais = caso.planDeEscape.last()
		val hobbie = this.darPistaExtra(villano.getHobbies() , 0.5)
		
		val infoPais = pais.caracteristicas.get(randomWithRange(pais.caracteristicas.size()-1,0))
		return("El villano que buscas no esta aqui pero puedo darte informacion" 
			+ "El villano que busca
" + sena + " se encuentra en un pais con esta caracterisca: "+ infoPais + hobbie
		)
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


class PistaClub implements Pista{
	
	override darPista(Caso caso){
		val senas = caso.responsable.senas_particulares
		val pista1 = senas.get(1)
		val pista2 = senas.get(0)
		
		val pista3 = darPistaExtra(caso.responsable.hobbies,0.7)
		
		return "El villano que buscas no esta aqui pero puedo
		darte informacion " + ". El villano tiene estas caracteristicas: "+ pista1 + " y " + pista2 + "
        " + pista3
	}
}

class PistaBanco implements Pista{
	
	override darPista(Caso caso){
		val destino = caso.planDeEscape.last()
		val pista1 = destino.caracteristicas.get(randomWithRange(0,destino.caracteristicas.size()-1))
		val pista2 = caso.responsable.senas_particulares.get(randomWithRange(0,caso.responsable.senas_particulares.size()-1))
		return "El villano que buscas no esta aqui pero puedo
		darte informacion " + ". El pais al que huyó " + pista1 + " y
		el villano que busca  " + pista2
	}
}