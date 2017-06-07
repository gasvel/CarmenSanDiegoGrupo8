app.controller('NuevoPaisCtrl', function($resource, Pais,PaisAEditar, $state, $stateParams) {

	'use strict';

	console.log("funcoCtrlPaisEdit");

    var self = this;
    
    self.paisSeleccionado=PaisAEditar;
    self.paisSeleccionado.get={
    		  "nombre": "",
    		  "lugares": [],
    		  "conexiones": []
    		};


    
    this.esEdit= function(){
    	return false;
    }
    
    this.esNuevo= function(){
    	return true;
    }

    function errorHandler(error) {
        self.notificarError(error.data);
    };
    
    
    this.guardarPais= function() {
        Pais.save(this.paisSeleccionado, function() {
            self.notificarMensaje('Pais creado!');
        }, errorHandler);

    };
    
    this.cancel= function(){
    	$state.go("mapamundi");
    }
    
    this.editarCarac=function(){
    	$state.go("editarCarac");
    };
    
    this.editarConex=function(){
    	$state.go("editarConexNew");
    };

    this.editarLugaresDeInteres=function(){
    	$state.go("editarLugaresDeInteresNew");
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
