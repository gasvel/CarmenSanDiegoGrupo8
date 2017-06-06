app.controller("PistaCtrl", function($resource, $state,$timeout, $stateParams,Pista, LugarVisitado, CasoActual) {
	
	'use strict';

    var self = this;
    
    self.casoActual = CasoActual;
    console.log(self.casoActual.get);
    self.ubicacionActual = LugarVisitado;
    console.log(self.ubicacionActual.get);

    self.mensaje= "";
    
    function errorHandler(error) {
        self.notificarError(error.data);
    }

   
    
 
    this.darPista = function(){
    	Pista.get({lugar: self.ubicacionActual.get.nombre ,casoId: self.casoActual.get.id},function(data){
        	self.mensaje= data.pista;
        	console.log(data);
    	},errorHandler);
    }
    this.darPista();

    
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