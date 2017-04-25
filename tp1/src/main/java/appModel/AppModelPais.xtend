package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import tp1.Pais
import tp1.Lugar
import org.uqbar.commons.utils.ApplicationContext
import tp1.RepoPaises

@Accessors
@Observable
class AppModelPais {
	
	String caracteristicaSeleccionada
	Lugar lugarSeleccionado
	Pais conexionSeleccionada
	Pais pais
	
	new(Pais otroPais) {
		pais = otroPais
		
	}
	
	def eliminarConexionSeleccionada(){
		pais.conexiones.remove(conexionSeleccionada)
		ObservableUtils.firePropertyChanged(pais, "conexiones")
	}
	
	def guardarConexionSeleccionada(){
		if(pais != conexionSeleccionada){
			pais.conexiones.add(conexionSeleccionada)
			ObservableUtils.firePropertyChanged(pais, "conexiones")	
		}
	}
	
	def eliminarLugarSeleccionado(){
		pais.lugaresDeInteres.remove(lugarSeleccionado)
		
		ObservableUtils.firePropertyChanged(pais, "lugaresDeInteres")
	}
	
	def guardarLugarSeleccionado(){
		if(!pais.lugaresDeInteres.contains(lugarSeleccionado)){	
			pais.lugaresDeInteres.add(lugarSeleccionado)
			ObservableUtils.firePropertyChanged(pais, "lugaresDeInteres")
		}
	}
	
	def eliminarCaracteristicaSeleccionada() {
		pais.caracteristicas.remove(caracteristicaSeleccionada) 
		
		ObservableUtils.firePropertyChanged(pais, "caracteristicas")
	}
	
	def guardarCaracteristicaSeleccionada() {
		pais.caracteristicas.add(caracteristicaSeleccionada)
		ObservableUtils.firePropertyChanged(pais, "caracteristicas")
	}
	
	def actualizarPaises(){
		
		repoPaises.update(pais)
		
	}
	
	def nuevoPais() {
		repoPaises.create(pais)
	}
	
	def RepoPaises getRepoPaises() {
		ApplicationContext.instance.getSingleton(typeof(Pais))
	}
	
}