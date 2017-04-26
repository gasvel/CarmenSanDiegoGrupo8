package appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import tp1.Pais
import tp1.Lugar
import org.uqbar.commons.utils.ApplicationContext
import tp1.RepoPaises
import java.util.List
import tp1.Banco
import tp1.Club
import tp1.Embajada
import tp1.Biblioteca
import org.uqbar.commons.model.UserException

@Accessors
@Observable
class AppModelPais {
	
	List<Lugar> lugaresDisponibles = #[new Banco, new Club, new Embajada, new Biblioteca]
	String caracteristicaSeleccionada
	String caracteristicaNueva
	Lugar lugarSeleccionado
	Lugar lugarAEliminar
	Pais conexionSeleccionada
	Pais pais
	AppModelMapamundi mapamundi
	
	new(Pais otroPais, AppModelMapamundi model) {
		pais = otroPais
		mapamundi = model
		
	}
	
	def eliminarConexionSeleccionada(){
		pais.conexiones.remove(conexionSeleccionada)
		ObservableUtils.firePropertyChanged(pais, "conexiones")
	}
	
	def guardarConexionSeleccionada(){
		if(pais.nombre != conexionSeleccionada.nombre && !pais.conexiones.contains(conexionSeleccionada)){
			pais.conexiones.add(conexionSeleccionada)
			ObservableUtils.firePropertyChanged(pais, "conexiones")	
		}
		else {
			throw new UserException(conexionSeleccionada.nombre + " ya esta en las conexiones")
		}
	}
	
	def eliminarLugarSeleccionado(){
		
		pais.lugaresDeInteres.remove(lugarAEliminar)
		ObservableUtils.firePropertyChanged(pais, "lugaresDeInteres")
	}
	
	def guardarLugarSeleccionado(){
		
		if(pais.lugaresDeInteres.findFirst[it.toString == lugarSeleccionado.toString]== null){	
			pais.lugaresDeInteres.add(lugarSeleccionado)
			ObservableUtils.firePropertyChanged(pais, "lugaresDeInteres")
		}
		else {
			throw new UserException("Ya existe " + lugarSeleccionado + " en este pais")
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
		ObservableUtils.firePropertyChanged(mapamundi, "paises")
		
		
	}
	
	def nuevoPais() {
		repoPaises.create(pais)
		ObservableUtils.firePropertyChanged(mapamundi, "paises")
	}
	

	def RepoPaises getRepoPaises() {
		ApplicationContext.instance.getSingleton(typeof(Pais))
	}
	
}