package tp1Vista


import org.uqbar.arena.windows.SimpleWindow
import tp1.CarmenSanDiego
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.List
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button

class MapamundiWindow extends SimpleWindow<CarmenSanDiego>{
	
	new(WindowOwner parent, CarmenSanDiego model) {
		super(parent, model)
		title = "Mapamundi"
	}
	
	override protected addActions(Panel arg0) {
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val panelIzq = new Panel(mainPanel)
		panelIzq.layout = new VerticalLayout
		
		crearLista(panelIzq)
	}
	
	def crearLista(Panel panelIzq){
		
		new Label(panelIzq).text = "Paises"
		

		
		new List(panelIzq) => [
			
			items <=> "mapamundi"
			value <=> "paisElegido" 
		]
		
		new Button(panelIzq) => [
			
			caption = "Eliminar"
			onClick [ | modelObject.eliminarPaisSeleccionado()]

		]
		
	}
	
	
	
}