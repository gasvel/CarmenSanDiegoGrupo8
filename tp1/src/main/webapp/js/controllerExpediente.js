app.controller('ExpedienteCtrl', function($resource , Villanos,Villano, $state, $stateParams, $timeout) {

	'use strict';

    var self = this;

    self.villanos = [];

    function errorHandler(error) {
        self.notificarError(error.data);
    }

    this.actualizarLista = function() {
        Villanos.query(function(data) {
            self.villanos = data;
        }, errorHandler);
    };
    this.actualizarLista();
    
    this.nuevoVillano = function() {
    	$state.go("nuevoVillano");
        
    };

    this.eliminarVillano= function() {
       
                Villano.remove({id:self.villanoSeleccionado.id}, function() {
                    self.notificarMensaje('Villano eliminado!');
                    self.actualizarLista();
                }, errorHandler);
 
     };
     

     this.seleccionarVillano=function(villano){
    	 
    	  Villano.get({id: villano.id},function(data){
    	  	self.villanoSeleccionado= data;
    	  },errorHandler);
    	
     };

    
    this.editarVillano= function() {
    	$state.go("editarVillano", {id: self.villanoSeleccionado.id});
    };

  
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
