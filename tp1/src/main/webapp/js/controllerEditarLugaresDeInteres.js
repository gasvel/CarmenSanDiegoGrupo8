app.controller('EditarLugaresDeInteresCtrl', function($resource, Pais, $state, $stateParams) {

	'use strict';

    var self = this;
    

    
    this.esCarac= function(){
    	return false;
    }
    
    this.esConex= function(){
    	return false;
    }
    
    this.esLugaresDeInteres= function(){
    	return true;
    }

    function errorHandler(error) {
        self.notificarError(error.data);
    };
    

    
    this.cancel= function(){
    	$state.go("nuevoPais");
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