package tp1

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable

class CarmenSanDiego {
	List<Villano> villanos
	List<Pais> mapamundi
	List<Caso> casosDisponibles
	Caso casoActual
	Boolean ganador
	
	new(){
		this.villanos = new ArrayList<Villano>
		this.mapamundi = new ArrayList<Pais>
		val caso1 = new Caso("A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse cuenta del                    faltante de gran valor! El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor conocido como Ramsés              III. El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna, su misión como detective            es desifrar el responsable de tal crímen y apresarlo.", "tumba del faraon")
		this.casosDisponibles = new ArrayList<Caso>
		casosDisponibles.add(caso1)
		this.ganador  = false
	}
	
	def nuevaPartida(Villano villano, List<Pais> plan, Pais lugar){
		val caso = new Caso( villano,  plan,  lugar)
		this.casoActual = caso
	}
	
	def nuevoPais(String nombre, List<String> caracteristicas, List<Lugar> lugares, List<Pais> conexiones ){
		var pais = new Pais(nombre, caracteristicas, lugares, conexiones)
		mapamundi.add(pais)
	}
	
	def nuevoVillano(String nombre, String sexo, List<String> senas, List<String> hobbies ){
		var villano = new Villano(nombre,sexo, senas, hobbies)
		villanos.add(villano)
	}
}