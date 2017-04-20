package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import tp1.Pais
import tp1.CarmenSanDiego
import tp1.Lugar

@Accessors
@Observable
class AppModelPais {
	
	String caracteristicaSeleccionada
	Lugar lugarSeleccionado
	Pais conexionSeleccionada
	CarmenSanDiego model
	Pais pais
	
	new(Pais otroPais, CarmenSanDiego modelo) {
		pais = otroPais
		model = modelo
		
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
		model.paisElegido = pais
		ObservableUtils.firePropertyChanged(model, "paisElegido")
	}
	
	def nuevoPais() {
		model.mapamundi.add(pais)
		ObservableUtils.firePropertyChanged(model, "mapamundi")
	}
}