package tp1Vista

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import tp1.Pais
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.aop.windows.TransactionalDialog

class EditarCaracteristicas extends TransactionalDialog<Pais>{
	
	new(WindowOwner parent, Pais model) {
		super(parent, model)
		title = "Editar Caracteristicas"
	}

	
	override protected addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick [ | this.accept]
		]
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		new Label(mainPanel).text = "Caracteristicas"
		new List(mainPanel) => [
			items <=> "caracteristicas"
		]
		
		new Button(mainPanel) => [
			caption = "Eliminar"
			onClick [ | /*eliminar carac seleccionada */]
		]
		
		val panelAgregar = new Panel(mainPanel)
		panelAgregar.layout = new HorizontalLayout
		
		new TextBox(panelAgregar) => [
			value <=> "caracteristica" //igual no creo que se deba bindear contra la lista sino agregar a la lista pero eso lo deberia hacer el boton agregar
		]
		
		new Button(panelAgregar) => [
			caption = "Agregar"
			onClick [ | /* mismo dilema de arriba  */]
		]
	}
	
}