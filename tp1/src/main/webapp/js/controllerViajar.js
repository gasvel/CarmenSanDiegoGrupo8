app.controller("ViajeCtrl", function($resource, $state,$timeout, $stateParams, Viajar,UbicacionActual,UltimoPais, Pais) {
	
	'use strict';

    var self = this;
    
    self.ubicacionActual = UbicacionActual;
    self.ultimoPais = UltimoPais;
    console.log(self.ubicacionActual.get);

    
    function errorHandler(error) {
        self.notificarError(error.data);
    }

 
   this.seleccionarPais= function(pais){
	   Pais.get({id:pais.id},function(data){
		   self.paisSeleccionado = data;
	   },errorHandler);
   }
   
   this.viajar= function(){
	   Viajar.save(this.paisSeleccionado,{destinoId: self.paisSeleccionado.id},function(data){
		   self.notificarMensaje(data.id);
		   self.ultimoPais.get= self.ubicacionActual.get;
		   self.ubicacionActual.get = self.paisSeleccionado;
		   self.paisSeleccionado = null;
		   
	   }, errorHandler);
	   
   }
   
   this.getPais= function(idPais){
	   Pais.get({id:idPais},function(data){
		   return data;
	   },errorHandler);
   }
   
   this.volverPais= function(){
	   Viajar.save({destinoId: self.ultimoPais.get.id},function(data){
		   this.notificarMensaje(data);
		   
	   }, errorHandler);
	   self.paisSeleccionado= self.ubicacionActual.get;
	   self.ubicacionActual.get = self.ultimoPais.get;
	   self.ultimoPais.get = self.paisSeleccionado;
   }


    
    this.msgs = [];
    this.notificarMensaje = function(mensaje) {
        this.msgs.push(mensaje);
        this.notificar(this.msgs);
    };

    this.errors = [];
    this.notificarError = function(mensaje) {
        this.errors.push(mensaje);
        this.notificar(this.errors);
    };

    this.notificar = function(mensajes) {
        $timeout(function() {
            while (mensajes.length > 0) mensajes.pop();
        }, 3000);
    }
    
    
    
});