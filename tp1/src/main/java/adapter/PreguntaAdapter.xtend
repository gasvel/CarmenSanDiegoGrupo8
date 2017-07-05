package adapter

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import tp1.Respuesta
import tp1.Pregunta

@Observable
@Accessors
class PreguntaAdapter {
	String texto;
	List<Respuesta> respuestas;
	String categoria;
	
	new(Pregunta pregunta){
		texto =pregunta.texto
		respuestas = pregunta.respuestas
		categoria = pregunta.categoria
	}
}
