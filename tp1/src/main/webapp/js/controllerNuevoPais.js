app.controller('NuevoVillanoCtrl', function($resource,$timeout, Villano, $state, $stateParams) {

	'use strict';

	console.log("funcoCtrlPaisNew");

    var self = this;
    
    self.villano={
    		  "nombre": "",
    		  "sexo": "",
    		  "senas_particulares": [],
    		  "hobbies": []
    		};
    self.senaInput="";
    self.hobbieInput="";

    
    this.esEdit= function(){
    	return false;
    }
    
    this.esNuevo= function(){
    	return true;
    }

    function errorHandler(error) {
        self.notificarError(error.data);
    };
    
    
    this.guardarVillano= function() {
        Villano.save(this.villano, function() {
            self.notificarMensaje('Villano creado!');
        }, errorHandler);

    };
    
    this.cancel= function(){
    	$state.go("expediente");
    }
    
    this.addHobbie= function(){
    	self.villano.hobbies.push(self.hobbieInput)
    }
    
    this.addSena= function(){
    	self.villano.senas_particulares.push(self.senaInput)
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
