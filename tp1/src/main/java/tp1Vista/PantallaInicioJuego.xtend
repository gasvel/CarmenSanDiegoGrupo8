package tp1Vista

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import java.awt.Color
import tp1.CarmenSanDiego
import org.uqbar.arena.widgets.Button

class PantallaInicioJuego extends SimpleWindow<CarmenSanDiego> {
	
	new(WindowOwner parent, CarmenSanDiego model) {
		super(parent, model)
		title = "Caso a resolver"
	}
	
	override protected addActions(Panel actionPanel) {
		new Button(actionPanel) => [
			caption = "Aceptar Caso"
			onClick [ | resolverMisterio]
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Detective tenemos un caso para usted!"
		new Label(mainPanel) => [
    	background = Color.YELLOW
    	value <=> "casoActual.reporte"
    	height = 200
    	width = 350
		]
	}
	
	def resolverMisterio(){
		this.close()
		(new ResolverMisterioWindow(this, modelObject)).open()
	}
	
	
}