package tp1Vista

import org.uqbar.arena.windows.SimpleWindow
import tp1.CarmenSanDiego
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button

class ResolverMisterioWindow extends SimpleWindow<CarmenSanDiego> {
	
	new(WindowOwner parent, CarmenSanDiego model) {
		super(parent, model)
	}
	
	override protected addActions(Panel arg0) {
			}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Usted esta en:" + modelObject.casoActual.lugarDeRobo.nombre
		
		new Button(mainPanel) => [
			caption = "Expediente"
			onClick [| abrirExpediente]
		]
	}
	
	def abrirExpediente() {
		new ExpedientesRestrictedWindow(this, modelObject).open()
	}
	
}