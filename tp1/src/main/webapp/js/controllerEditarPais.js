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
    		self.pais.id= self.data.id;
    		self.pais.nombre= self.data.nombre;
    		self.pais.conexiones= self.data.conexiones;
    		self.pais.lugares= self.data.lugares;

    	},errorHandler);
    };
    
    self.getPais();

    this.guardarPais= function() {
        Pais.update(this.pais, function() {
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
    
    this.editarCarac=function(){
    	$state.go("editarCarac", {id: self.paisSeleccionado.id});
    };
    
    this.editarConex=function(){
    	$state.go("editarConex", {id: self.paisSeleccionado.id});
    };

    this.editarLugaresDeInteres=function(){
    	$state.go("editarLugaresDeInteres", {id: self.paisSeleccionado.id});
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
