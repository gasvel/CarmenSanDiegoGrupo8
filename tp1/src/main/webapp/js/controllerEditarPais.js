app.controller('EditarPaisCtrl', function($resource, Pais,PaisAEditar, $state, $timeout, $stateParams) {

	'use strict';
	
	console.log("funcoCtrlPaisEdit");

    var self = this;
    self.pais= PaisAEditar;


    function errorHandler(error) {
        self.notificarError(error.data);
    };
    
    this.getPais=function(){
    	Pais.get({id: $stateParams.id},function(data){
    		self.paisDevuelto = data;
    		self.pais.get.id= self.paisDevuelto.id;
    		self.pais.get.nombre= self.paisDevuelto.nombre;
    		self.pais.get.conexiones= self.paisDevuelto.conexiones;
    		self.pais.get.lugares= self.paisDevuelto.lugares;
    		

    		console.log(self.pais);


    	},errorHandler);
    };
    
    self.getPais();

    this.guardarPais= function() {
        Pais.update(this.pais.get, function() {
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
    	$state.go("editarCarac", {id: $stateParams.id});
    };
    
    this.editarConex=function(){
    	$state.go("editarConex", {id: $stateParams.id});
    };

    this.editarLugaresDeInteres=function(){
    	$state.go("editarLugaresDeInteres", {id: $stateParams.id});
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
