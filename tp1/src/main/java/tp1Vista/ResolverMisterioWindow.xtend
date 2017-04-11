package tp1Vista

import org.uqbar.arena.windows.SimpleWindow
import tp1.CarmenSanDiego
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List

class ResolverMisterioWindow extends SimpleWindow<CarmenSanDiego> {
	
	new(WindowOwner parent, CarmenSanDiego model) {
		super(parent, model)
	}
	
	override protected addActions(Panel arg0) {
			}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Usted esta en:" + modelObject.ubicacionActual
		
		
		new Button(mainPanel) => [
			caption = "Viajar"
			onClick [| abrirSeleccionDeDestino]
		]
		new Button(mainPanel) => [
			caption = "Expediente"
			onClick [| abrirExpediente]
		]
		
		new Label(mainPanel).text = "Recorrido Criminal:"
		new List(mainPanel) => [
			items <=> "recorridoCorrecto"
		]
		new Label(mainPanel).text = "Destinos Fallidos:"
		new List(mainPanel) => [
			items <=> "recorridoIncorrecto"
		]
		
		
	}
	
	def abrirSeleccionDeDestino() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def abrirExpediente() {
		new ExpedientesRestrictedWindow(this, modelObject).open()
	}
	
}