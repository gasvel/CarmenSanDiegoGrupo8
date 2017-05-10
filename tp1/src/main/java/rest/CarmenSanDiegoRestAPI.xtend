package rest

import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import org.uqbar.commons.model.UserException
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import tp1.CarmenSanDiego
import tp1.Caso
import adapter.CasoAdapter

@Controller
class CarmenSanDiegoRestAPI {
	   extension JSONUtils = new JSONUtils
	   
	   CarmenSanDiego juego;
	   
	   
	   new(CarmenSanDiego carmen){
	   		juego = carmen
	   }
	
	
	
	 @Post("/iniciarjuego")
	def generarJuego(){
		response.contentType = ContentType.APPLICATION_JSON
		this.juego.generarPartida
		val caso = adaptarCaso(this.juego.casoActual)
		
		ok(caso.toJson)
	}
	
	def adaptarCaso(Caso caso) {
		new CasoAdapter(caso)
	}
	
	@Get("/pistaDelLugar/:lugar/:casoId")
	def obtenerPista(){
		response.contentType = ContentType.APPLICATION_JSON
		 try {        	
            var caso = this.juego.getCaso(Integer.valueOf(casoId))
            if (caso == null) {
            	notFound(getErrorJson("No existe caso con ese id"))
            } else {
            	var lugarEnPais = caso.getLugar(lugar)
            	if(lugar == null){
            		notFound(getErrorJson("No existe lugar con ese nombre"))
            	}
            	else{
            		ok(lugarEnPais.obtenerPista(caso).toJson)
            	}
            }
        }
        catch (NumberFormatException ex) {
        	badRequest(getErrorJson("El id debe ser un numero entero"))
        }
	}
	
	@Post("/emitirOrdenPara/:villanoId/:casoId")
	def emitirOrden(){
		response.contentType = ContentType.APPLICATION_JSON
		 try {        	
            var caso = this.juego.getCaso(Integer.valueOf(casoId))
            if (caso == null) {
            	notFound(getErrorJson("No existe caso con ese id"))
            } else {
            	var villano = this.juego.repoVillanos.search(Integer.valueOf(villanoId))
            	if(villano == null){
            		notFound(getErrorJson("No existe lugar con ese nombre"))
            	}
            	else{
            		caso.emitirOrdenDeArresto(villano)
            		ok()
            	}
            }
        }
        catch (NumberFormatException ex) {
        	badRequest(getErrorJson("El id debe ser un numero entero"))
        }
	}
	
	@Post("/viajar/:destinoId")
	def viajarADestino(){
		response.contentType = ContentType.APPLICATION_JSON
		try{
			var pais = juego.repoPaises.search(Integer.valueOf(destinoId))
			if(pais == null){
				notFound(getErrorJson("No existe pais con ese id"))
				
			}
			else{
				juego.viajar(pais)	
				val caso = adaptarCaso(juego.casoActual)
				
				ok(caso.toJson)
			
			}
		}
		catch (NumberFormatException ex) {
        	badRequest(getErrorJson("El id debe ser un numero entero"))
        }

	}
	
	@Get("/villanos")
	def obtenerVillanos(){
		response.contentType = ContentType.APPLICATION_JSON
		ok(this.juego.repoVillanos.getVillanos().toJson)
	}
	
	@Get("/paises")
	def obtenerPaises(){
		response.contentType = ContentType.APPLICATION_JSON
		ok(this.juego.repoPaises.getPaises().toJson)
	}
	
	
	private def getErrorJson(String message) {
        '{ "error": "' + message + '" }'
    }
	
	
}