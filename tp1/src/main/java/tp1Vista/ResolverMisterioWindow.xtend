package tp1Vista

import org.uqbar.arena.windows.SimpleWindow
import tp1.CarmenSanDiego
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*


class ResolverMisterioWindow extends SimpleWindow<CarmenSanDiego> {
	
	new(WindowOwner parent, CarmenSanDiego model) {
		super(parent, model)
	}
	
	override protected addActions(Panel arg0) {
			}
	
	override protected createFormPanel(Panel arg0) {
		new Label(arg0).text = "Usted esta en:" new Label(arg0) => [
			value <=> "casoActual.lugarDeRobo.nombre"
			]
		
	}
	
}