package tp1Vista

import org.uqbar.arena.widgets.Panel
import tp1.CarmenSanDiego
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Button

class PantallaPrincipal extends SimpleWindow<CarmenSanDiego> {
	
	
	new(WindowOwner parent,CarmenSanDiego model) {
		super(parent,model)
		title = "Donde esta Carmen San Diego?"
	}
	
	override createFormPanel(Panel arg0) {
	
		new Label(arg0).text = "Bienvenido a Carmen San Diego"

	}
	
	override protected addActions(Panel mainPanel) {
	  new Button(mainPanel) => [
      caption = "Resolver Misterio"
      onClick[ | this.inicioDeJuego  ]
	  ]
	  
	  new Button(mainPanel) => [
	  	caption = "Mapamundi"
	  	onClick[ | this.iniciarMapamundi ] 
	  ]
	  
	  new Button(mainPanel) => [
	  	caption = "Expedientes"
	  	onClick[ | this.iniciarExpedientes ]
	  ]
	  
	}
	
	def inicioDeJuego() {
		(new PantallaInicioJuego(this, modelObject)).open()
	}
	
	def iniciarMapamundi(){
		(new MapamundiWindow(this, modelObject).open )
	}

	def iniciarExpedientes(){
		new ExpedientesWindow(this, modelObject).open 
	}
	
}