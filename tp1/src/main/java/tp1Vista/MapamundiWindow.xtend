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
import org.uqbar.arena.layout.HorizontalLayout

class MapamundiWindow extends SimpleWindow<CarmenSanDiego>{
	
	new(WindowOwner parent, CarmenSanDiego model) {
		super(parent, model)
		title = "Mapamundi"
	}
	
	override protected addActions(Panel arg0) {
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		mainPanel => [
			layout = new HorizontalLayout
			
			]
		val panelIzq = new Panel(mainPanel)
		val panelDer = new Panel(mainPanel)
		panelIzq.layout = new VerticalLayout
		
		crearLista(panelIzq)
		crearAtributos(panelDer)
	}
	
	def crearAtributos(Panel panelDer){
		new Label(panelDer).text = "Nombre:"
		new Label(panelDer) => [
			value <=> "paisElegido"
		]
		new Label(panelDer).text = "Caracteristicas"
		new List(panelDer) => [
			items <=> "paisElegido.caracteristicas"
		]
		
		new Label(panelDer).text = "Conexiones"
		new List(panelDer) => [
			items <=> "paisElegido.conexiones"
		]
		
		new Label(panelDer).text = "Lugares de interes"
		new List(panelDer) => [
			items <=> "paisElegido.lugaresDeInteres"
		]
	}
	
	def crearLista(Panel panelIzq){
		
		new Label(panelIzq).text = "Paises"
		

		
		new List(panelIzq) => [
			
			items <=> "mapamundi.paises"
			value <=> "paisElegido" 
		]
		
		new Button(panelIzq) => [
			
			caption = "Eliminar"
			onClick [ | modelObject.eliminarPaisSeleccionado()]

		]
		
		new Button(panelIzq)=> [
			caption = "Nuevo"
			onClick [ | nuevoPais]
		]
		
		new Button(panelIzq)=> [
			caption = "Editar"
			onClick [ | editarPais]
		]
		
	}
	
	def editarPais() {
		new EditarPaisWindow(this,modelObject.getPaisElegido).open()
	}
	
	def nuevoPais(){
		new NuevoPaisWindow(this).open()
	}
	
	
}