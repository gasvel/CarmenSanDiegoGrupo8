package tp1Vista

import org.uqbar.arena.windows.SimpleWindow
import tp1.Pais
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Selector
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*


class EditarConexiones extends SimpleWindow<Pais>{
	
	
	new(WindowOwner parent, Pais model) {
		super(parent, model)
		title = "Editar conexiones"
	}
	
	override protected addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick [ | /*deberia guardar */]
		]
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		new Label(mainPanel).text = "Conexiones"
		new List(mainPanel) => [
			items <=> "modelObject.conexiones"
		]
		
		new Button(mainPanel) => [
			caption = "Eliminar"
			onClick [ | /*eliminar conexion seleccionada */]
		]
		
		val panelAgregar = new Panel(mainPanel)
		panelAgregar.layout = new HorizontalLayout
		
		new Selector<Pais>(panelAgregar) => [
			allowNull(false)
			value <=> "conexion" //igual no creo que se deba bindear contra la lista sino agregar a la lista pero eso lo deberia hacer el boton agregar
			items <=> "conexiones" //es un pais la coleccion
		] //pregunta sobre como pegarle con esto
		
		new Button(panelAgregar) => [
			caption = "Agregar"
			onClick [ | /* mismo dilema de arriba  */]
		]
		
	}
	
}