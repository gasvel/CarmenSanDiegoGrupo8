package tp1


import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity
import adapter.PistaAdapter
import org.uqbar.commons.utils.ApplicationContext

@Observable
@Accessors
class Lugar extends Entity {
	String nombre
	Pregunta preguntaActual
	
	
	new(){
		
	}
	
	def getNombre(){
		nombre
	}
	
	def darInfo(Pista pista,Caso caso){
		caso.agregarRecorridoCorrectoIncorrecto
		
		if(!caso.ubicacionEnPlanDeEscape()){
			return new PistaAdapter("Quien te conoce boludo! Tomatela te dije!");
		}
		else{
			if(caso.esPaisFinal()){
				if(nombre == caso.ubicacionActual.lugarVillano.nombre){
					new PistaAdapter(caso.getTextoFinal());
				}
				else{
					return new PistaAdapter("It's a trap!!");
				}
			}
			else{
				new PistaAdapter(pista.darPista(caso));
			}
		}
	}

	
	def obtenerPista(Caso caso){
		
	}
	
	def Pregunta nuevaPregunta(){
		
	}
	
	def RepoPreguntas getRepoPreguntas() {
		ApplicationContext.instance.getSingleton(typeof(Pregunta))
	}
	
	def nuevaRespuesta(int id,Caso caso){
		if(preguntaActual.idCorrecta == id){
			this.obtenerPista(caso)
		}
		else{
			"Respuesta incorrecta"
		}
	}
	
	def getRespuestaCorrecta(){
		preguntaActual.idCorrecta
	}


}

class Club extends Lugar{
	
	new(){
		nombre = "Club"
	}
	override obtenerPista(Caso caso){
		val pista = new PistaClub
		darInfo(pista,caso)
	}
	
	
	override nuevaPregunta(){
		preguntaActual = getRepoPreguntas.getByCat("Deportes")
		preguntaActual
	}

	override toString(){
		"Club"
	}
}

class Biblioteca extends Lugar {
	
	new(){
		nombre = "Biblioteca"
	}
	
	override obtenerPista(Caso caso){
		val pista = new PistaBiblioteca
		darInfo(pista,caso)
	}


	override nuevaPregunta(){
		preguntaActual= getRepoPreguntas.getByCat("Literatura")
		preguntaActual
	}
	
	override toString(){
		"Biblioteca"
	}
}


class Embajada extends Lugar {

	new(){
		nombre = "Embajada"
	}
	override obtenerPista(Caso caso){
		val pista = new PistaEmbajada
		darInfo(pista,caso)
	}
	
	
	override nuevaPregunta(){
		preguntaActual = getRepoPreguntas.getByCat("Geografia")
		preguntaActual
	}

	
	override toString(){
		"Embajada"
	}
}


class Banco extends Lugar {
	
	new(){
		nombre = "Banco"
	}
	override obtenerPista(Caso caso){
		val pista = new PistaBanco
		this.darInfo(pista,caso)
	}
	
	
	override nuevaPregunta(){
		preguntaActual = getRepoPreguntas.getByCat("Matematicas")
		preguntaActual
	}

	
	override toString(){
		"Banco"
	}
	
}