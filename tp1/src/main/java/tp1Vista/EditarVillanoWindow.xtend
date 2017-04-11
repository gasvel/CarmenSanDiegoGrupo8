package tp1Vista

import org.uqbar.arena.aop.windows.TransactionalWindow
import tp1.Villano
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List

class EditarVillanoWindow extends TransactionalWindow<Villano>{
	
	new(WindowOwner parent, Villano model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick [| this.accept()]
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Nombre:"
		new TextBox(mainPanel) => [
			value <=> "nombre"
			width = 100
		]

		new Label(mainPanel).text = "Sexo:"
		new TextBox(mainPanel) => [
			value <=> "sexo"
			width = 100
		]
		
		new Label(mainPanel).text = "Señas Particulares"
		new Button(mainPanel) => [
			caption = "Editar Señas Particulares"
			onClick [| abrirEditarSenas]
		]
		new List(mainPanel) => [
			items <=> "senas_particulares"
		]
		
		
		new Label(mainPanel).text = "Hobbies"
		new Button(mainPanel) => [
			caption = "Editar Hobbies"
			onClick [| abrirEditarHobbies]
		]
		new List(mainPanel) => [
			items <=> "hobbies"
		]
	}
	
	def abrirEditarHobbies() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def abrirEditarSenas() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}