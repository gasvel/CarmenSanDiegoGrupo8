package tp1
import org.uqbar.commons.model.CollectionBasedRepo
import java.util.List
import org.uqbar.commons.utils.Observable
import java.util.ArrayList
import java.util.Random

@Observable
class RepoPreguntas extends CollectionBasedRepo<Pregunta>{
	
	List<Pregunta> deportes = new ArrayList<Pregunta>()
	List<Pregunta> geografia = new ArrayList<Pregunta>()
	List<Pregunta> literatura = new ArrayList<Pregunta>()
	List<Pregunta> matematicas = new ArrayList<Pregunta>()
	
	
	def Pregunta create(String preg, List<Respuesta> resps, int correcta, String cat) {
		val pregunta = new Pregunta => [
			texto = preg
			respuestas = resps
			idCorrecta = correcta
			categoria = cat
			
		]
		this.create(pregunta)
		pregunta
	}
	
	override create(Pregunta preg){
		switch(preg.categoria){
			case "Deportes": deportes.add(preg)
						
			case "Geografia": geografia.add(preg)
			
			case "Literatura" : literatura.add(preg)
			
			case "Matematicas" : matematicas.add(preg)
		}
		
		super.create(preg)
	}
	
	def delete(String nombre){
		this.delete(get(nombre))
		
	}
	
	
	def List<Pregunta> getPreguntas() {
		allInstances	
	}
	
	def randomWithRange(int min, int max)
	{
   		val range = (max - min) + 1  
   		return (((Math.random() * range) + min) as int)
	}
	
	def Pregunta getByCat(String catg){
		switch(catg){
			case "Deportes": deportes.get(this.randomWithRange(0,deportes.size()-1))
						
			case "Geografia": geografia.get(this.randomWithRange(0,geografia.size()-1))
			
			case "Literatura" : literatura.get(this.randomWithRange(0,literatura.size()-1))
			
			case "Matematicas" : matematicas.get(this.randomWithRange(0,matematicas.size()-1))
		}
	}

	
	def Pregunta get(String texto) {
		preguntas.findFirst [ pregunta | pregunta.texto.equals(texto) ]
	}
	
	override createExample() {
		new Pregunta
	}
	

	
	
	override def update(Pregunta pregunta){
		super.update(pregunta)
	}
	


	
	override def Class<Pregunta> getEntityType() {
		typeof(Pregunta)
	}
	
	override protected getCriterio(Pregunta arg0) {
		null
	}
	
	def search(Integer id) {
		preguntas.findFirst[p| p.id == id]
	}
	
}