package tp1Vista

import org.uqbar.arena.Application
import java.util.ArrayList
import tp1.CarmenSanDiego
import tp1.Villano
import tp1.Caso
import tp1.Pais
import tp1.Lugar

class CarmenSanDiegoApplication extends Application {
	
	val carmenSanDiego = new Villano("Carmen San Diego","femenino",new ArrayList<String>, new ArrayList<String>)
	val pepe = new Villano("Pepe","masculino",new ArrayList<String>, new ArrayList<String>)
	val argentina = new Pais("Argentina",new ArrayList<String>,new ArrayList<Lugar>, new ArrayList<Pais>)
	val egipto = new Pais("Egipto", new ArrayList<String>, new ArrayList<Lugar>,new ArrayList<Pais>)
	val mexico = new Pais("Mexico", new ArrayList<String>, new ArrayList<Lugar>,new ArrayList<Pais>)
	val noruega = new Pais("Noruega", new ArrayList<String>, new ArrayList<Lugar>,new ArrayList<Pais>)
	val planDeE = new ArrayList<Pais>
	

	val caso = new Caso(carmenSanDiego, new ArrayList<Pais>, argentina,"A las 9 de la mañana en la ciudad del
 Cairo la comunidad científica fue
 conmovida al darse cuenta del
 faltante de gran valor! El sarcófago del
 faraón Usermaatra-Meriamón Ramsés
-Heqaiunu, mejor conocido como Ramsés
 III. El criminal fue muy prolijo y la 
escena del crimen no contaba con pista alguna
, su misión como detective es desifrar el
 responsable de tal crímen y apresarlo.", "tumba")
 
	override protected createMainWindow() {
		 val juego = new CarmenSanDiego => [
			planDeE.add(argentina)
			planDeE.add(mexico)
			agregarNuevoPais(egipto)
			agregarNuevoPais(mexico)
			agregarNuevoPais(noruega)
			agregarVillano(carmenSanDiego)
			agregarVillano(pepe)

			caso.setPlanDeEscape(planDeE)
			setCasoActual(caso)
			setUbicacionActual(planDeE.get(0))
			agregarPaisCorrecto(planDeE.get(0))
					]
		new PantallaPrincipal(this,juego)
	}
	

	
	static def main(String[] args) {
		new CarmenSanDiegoApplication().start
	}
}