app.controller('EditarPaisCtrl', function($resource, Pais, $state, $timeout, $stateParams) {

	'use strict';
	
	console.log("funcoCtrlPaisEdit");

    var self = this;


    function errorHandler(error) {
        self.notificarError(error.data);
    };
    
    this.getPais=function(){
    	Pais.get({id: $stateParams.id},function(data){
    		self.paisSeleccionado= data;
    	},errorHandler);
    };
    
    self.getPais();

    this.guardarPais= function() {
        Pais.update(this.paisSeleccionado, function() {
            self.notificarMensaje('Pais actualizado!');
        }, errorHandler);

    };
    
    this.cancel= function(){
    	$state.go("mapamundi");
    }
    
    this.esEdit= function(){
    	return true;
    }
    
    this.esNuevo= function(){
    	return false;
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
