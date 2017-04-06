package tp1Vista

import tp1.Pais
import org.uqbar.arena.windows.WindowOwner


class NuevoPaisWindow extends EditarPaisWindow{
	
	new(WindowOwner owner) {
		super(owner, new Pais)
	}
	
	override defaultTitle(){
		"Mapamundi - Nuevo Pais"
	}
	
}