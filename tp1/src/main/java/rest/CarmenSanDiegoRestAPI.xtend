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
import tp1.Villano
import org.uqbar.xtrest.api.annotation.Put
import tp1.Pais
import adapter.PaisAdapter
import excepciones.NoPuedeViajarPaisFueraDeLaConexionException
import org.uqbar.xtrest.api.Result

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
            	var lugarEnPais = this.juego.getLugar(caso,lugar)
            	if(lugarEnPais == null){
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
				
				try{
					juego.viajar(pais)	
					 val caso = adaptarCaso(juego.casoActual)
					 ok(caso.toJson)
					}
				catch (NoPuedeViajarPaisFueraDeLaConexionException ex){ 
						badRequest(getErrorJson("No te pases de listo chaval que no puedes viajar ahi"))
					}
			}
		}
		catch (NumberFormatException ex) {
        	badRequest(getErrorJson("El id debe ser un numero entero"))
        }

	}
	
	@Get("/villanos")
	def Result obtenerVillanos(){
		response.contentType = ContentType.APPLICATION_JSON
		ok(this.juego.repoVillanos.getVillanos().toJson)
	}
	
	@Get("/villanos/:id")
	def getVillano(){
		response.contentType = ContentType.APPLICATION_JSON
		try{
			var villano = this.juego.repoVillanos.search(Integer.valueOf(id))
			if(villano == null){
				notFound(getErrorJson("Recatate gil no existe villano con ese id"))
            } else {
            	ok(villano.toJson)
			}
		}
		catch(NumberFormatException ex) {
			badRequest(getErrorJson("El id debe ser un numero gato"))
		}
	}
	
	@Put("/villanos/:id")
	def updateVillano(@Body String body){
		response.contentType = ContentType.APPLICATION_JSON
		try{
			var Villano villanoActualizado = body.fromJson(Villano)
			var villano = this.juego.repoVillanos.search(Integer.valueOf(id))
			villano.copiarDatos(villanoActualizado)
			if(villano == null){
				notFound(getErrorJson("Recatate gil no existe villano con ese id"))
            } else {
				this.juego.repoVillanos.update(villano)
				ok()
			}
			
		}
		catch(NumberFormatException ex) {
			badRequest(getErrorJson("El id debe ser un numero gato"))
		}
	}
	
	@Delete("/villanos/:id")
	def deleteVillano(){
		response.contentType = ContentType.APPLICATION_JSON
		try{
			
			var villano = this.juego.repoVillanos.search(Integer.valueOf(id))
			if(villano == null){
				notFound(getErrorJson("Recatate gil no existe villano con ese id"))
            } else {
				this.juego.repoVillanos.delete(villano)
				ok()
			}
			
		}
		catch(NumberFormatException ex) {
			badRequest(getErrorJson("El id debe ser un numero gato"))
		}
	}
	
	@Post("/villanos")
	def nuevoVillano(@Body String body){
		response.contentType = ContentType.APPLICATION_JSON
        try {
	        val Villano villano = body.fromJson(Villano)
	        try {
				juego.repoVillanos.create(villano)
				ok()	        	
	        } 
	        catch (UserException exception) {
	        	badRequest(getErrorJson(exception.message))
	        }
        } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(getErrorJson("El body debe ser un Villano"))
        }
	}
	
	
	@Get("/paises")
	def obtenerPaises(){
		response.contentType = ContentType.APPLICATION_JSON
		ok(this.juego.getPaisesEnc.toJson)
	}
	
	
	@Get("/pais/:id")
	def getPaisPorId(){
		response.contentType = ContentType.APPLICATION_JSON
		try{
			var pais = this.juego.repoPaises.search(Integer.valueOf(id))
			if(pais == null){
				notFound(getErrorJson("Recatate gil no existe pais con ese id"))
            } else {
            	ok(juego.adaptarPais(pais).toJson)
			}
		}
		catch(NumberFormatException ex) {
			badRequest(getErrorJson("El id debe ser un numero gato"))
		}
	}
	
	@Put("/pais/:id")
	def updatePais(@Body String body){
		response.contentType = ContentType.APPLICATION_JSON
		try{	
			val PaisAdapter paisA = body.fromJson(PaisAdapter)
	        val paisMod =this.juego.convertirAPais(paisA)
			var pais = this.juego.repoPaises.search(Integer.valueOf(id))
			pais.copiarDatos(paisMod)
			if(pais == null){
				notFound(getErrorJson("Recatate gil no existe pais con ese id"))
            } else {
				this.juego.repoPaises.update(pais)
				ok()
			}			
		}
		catch(NumberFormatException ex) {
			badRequest(getErrorJson("El id debe ser un numero gato"))
		}
	}
	
	@Delete("/pais/:id")
	def deletePais(){
		response.contentType = ContentType.APPLICATION_JSON
		try{	
			var pais = this.juego.repoPaises.search(Integer.valueOf(id))
			if(pais == null){
				notFound(getErrorJson("Recatate gil no existe pais con ese id"))
            } else {
				this.juego.repoPaises.delete(pais)
				ok()
			}		
		}
		catch(NumberFormatException ex) {
			badRequest(getErrorJson("El id debe ser un numero gato"))
		}
	}

	@Post("/pais")
	def nuevoPais(@Body String body){
		response.contentType = ContentType.APPLICATION_JSON
        try {
	        val PaisAdapter paisA = body.fromJson(PaisAdapter)
	        val pais =this.juego.convertirAPais(paisA)
	        try {
	        	
				juego.repoPaises.create(pais)
				ok()	        	
	        } 
	        catch (UserException exception) {
	        	badRequest(getErrorJson(exception.message))
	        }
        } 
        catch (UnrecognizedPropertyException exception) {
        	badRequest(getErrorJson("El body debe ser un Pais"))
        }
	}
		
	private def getErrorJson(String message) {
        '{ "error": "' + message + '" }'
    }
	
	
}