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
	
	
	
	/* @Post("/iniciarjuego")
	def generarJuego(){
		
	}*/
	
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
		ok(this.juego.repoPaises.getPaises().toJson)
	}
	
	
}