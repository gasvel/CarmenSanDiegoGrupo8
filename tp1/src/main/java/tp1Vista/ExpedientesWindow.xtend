package tp1Vista

import org.uqbar.arena.windows.SimpleWindow
import tp1.CarmenSanDiego
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button

class ExpedientesWindow extends SimpleWindow<CarmenSanDiego>{
	
	new(WindowOwner parent, CarmenSanDiego model) {
		super(parent, model)
		title = "Expedientes"
	}
	
	override protected addActions(Panel arg0) {
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		mainPanel => [
			layout = new HorizontalLayout
		]
		
		val listaVillanos = new Panel(mainPanel)
		new Label(listaVillanos).text = "Villano"
		new List(listaVillanos) => [
			items <=> "villanos"
			value <=> "villanoElegido"
		]
		
		botonesDeEdicion(listaVillanos)
		
		val atributosVillano = new Panel(mainPanel)
		new Label(atributosVillano).text = "Nombre:" 
		new Label(atributosVillano) => [
			value <=> "villanoElegido"
		]
		new Label(atributosVillano).text = "Sexo:"
		new Label(atributosVillano) => [
			value <=> "villanoElegido.sexo"
		]
		new Label(atributosVillano).text = "Señas particulares:"
		new List(atributosVillano) => [
			items <=> "villanoElegido.senas_particulares"
		]
		new Label(atributosVillano).text = "Hobbies:"
		new List(atributosVillano) => [
			items <=> "villanoElegido.hobbies"
		]
	}
	
	def botonesDeEdicion(Panel panel) {
		new Button(panel) => [
			caption = "Nuevo"
			onClick [| nuevoVillano]
		]
		new Button(panel) => [
			caption = "Editar"
			onClick [| editarVillano]
		]
	}
	
	def editarVillano() {
		(new EditarVillanoWindow(this, modelObject.getVillanoElegido())).open()
	}
	
	def nuevoVillano() {
		(new NuevoVillanoWindow(this)).open()
	}
	
}