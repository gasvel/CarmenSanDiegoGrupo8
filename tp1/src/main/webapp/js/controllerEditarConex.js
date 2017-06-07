app.controller('EditarConexCtrl', function($resource, Pais, $state, $stateParams) {

	'use strict';

    var self = this;
    

    
    this.esCarac= function(){
    	return false;
    }
    
    this.esConex= function(){
    	return true;
    }
    
    this.esLugaresDeInteres= function(){
    	return false;
    }

    this.cancel= function(){
    	$state.go("nuevoPais");
    }
    
    this.getPais=function(){
    	Pais.get({id: $stateParams.id},function(data){
    		self.paisSeleccionado= data;
    	},errorHandler);
    };
    
    self.getPais();
    this.guardar= function() {
        Pais.update(this.paisSeleccionado, function() {
            self.notificarMensaje('Pais actualizado!');
        }, errorHandler);

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
