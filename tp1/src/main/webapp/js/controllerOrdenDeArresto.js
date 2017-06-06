console.log("funco orden")
app.controller("OrdenDeArrestoCtrl", function($resource, $state,$timeout, $stateParams,VillanoConOrden,Orden, Villanos, CasoActual) {
	
	'use strict';

    var self = this;
    
    self.villanos = [];
    self.casoActual = CasoActual;
    self.ordenEmitidaPara = VillanoConOrden;
    
    function errorHandler(error) {
        self.notificarError(error.data);
    }

    

    this.actualizarLista = function() {
        Villanos.query(function(data) {
        	console.log(data);
            self.villanos = data;
        }, errorHandler);
    };
    this.actualizarLista();
    
    this.elegirVillano= function(villano){
    	self.villanoSeleccionado = villano;
    	console.log(self.villanoSeleccionado);
    }
    
    this.emitirOrden = function(){
    	Orden.save({villanoId:self.villanoSeleccionado.id ,casoId: self.casoActual.get.id},function(data){
    		self.notificarMensaje(data);
        	self.ordenEmitidaPara.get = self.villanoSeleccionado;

    	},errorHandler);
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