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
		ok(this.juego.casosDisponibles.size().toJson)
	}
	
	/*/@Get("/pistaDelLugar")
	def obtenerPista(String lugar,int casoId){
		response.contentType = ContentType.APPLICATION_JSON
		ok(this.juego.toJson)
	}*/
	
	@Get("/villanos")
	def obtenerVillanos(){
		response.contentType = ContentType.APPLICATION_JSON
		ok(this.juego.repoVillanos.getVillanos().toJson)
	}
	
	@Get("/paises")
	def obtenerPaises(){
		response.contentType = ContentType.APPLICATION_JSON
		ok(this.juego.getPaisesEnc.toJson)
	}
	
	@Get("/paises/:id")
	def getPaisPorId(){
		response.contentType = ContentType.APPLICATION_JSON
		try{
			var pais = this.juego.getPais(Integer.valueOf(id))
			if(pais == null){
				notFound(getErrorJson("Recatate gil no existe pais con ese id"))
            } else {
            	ok(pais.toJson)
			}
		}
		catch(NumberFormatException ex) {
			badRequest(getErrorJson("El id debe ser un numero gato"))
		}
	}
	
	def getErrorJson(String message) {
        '{ "pifiaste": "' + message + '" }'
    }
	
	
}