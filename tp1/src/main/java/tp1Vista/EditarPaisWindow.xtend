package tp1Vista

import org.uqbar.arena.aop.windows.TransactionalWindow
import tp1.Pais
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.List

class EditarPaisWindow extends TransactionalWindow<Pais>{
	
	new(WindowOwner parent, Pais model) {
		super(parent, model)
		title = defaultTitle
	}
	
	def defaultTitle(){
		"Mapamundi - Editar Pais"
	}
	
	override protected addActions(Panel actionPanel) {
		new Button(actionPanel) => [
			caption = "Aceptar"
			onClick[ | this.accept()]
		]

	}

	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Nombre"
		new TextBox(mainPanel) => [
			value <=> "nombre"
			width = 250
		]
		
		val primeraFila = new Panel(mainPanel) => [
		layout = new HorizontalLayout
		]
		
		new Label(primeraFila).text = "Caracteristicas"
		new Button(primeraFila) => [
			caption = "Editar Caracteristicas"
			onClick [| editarCaracteristicas]
		]
		
		new List(mainPanel) => [
			items <=> "caracteristicas"
		]
		
		val segundaFila = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		
		new Label(segundaFila).text = "Conexiones"
		new Button(segundaFila) => [
			caption = "Editar Conexiones"
			onClick [| editarConexiones]
		]
		
		new List(mainPanel) => [
			items <=> "conexiones"
		]
		
		val terceraFila = new Panel(mainPanel) => [
		layout = new HorizontalLayout
		]
		
		new Label(terceraFila).text = "Lugares de interes"
		new Button(terceraFila) => [
			caption = "Editar Lugares"
			onClick [| editarLugares]
		]
		
		new List(mainPanel) => [
			items <=> "lugaresDeInteres"
		]
	}
	
	def editarLugares() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def editarConexiones() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def editarCaracteristicas() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}