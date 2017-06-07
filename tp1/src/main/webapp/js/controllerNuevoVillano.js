app.controller('NuevoVillanoCtrl', function($resource,$timeout, Villano, $state, $stateParams) {

	'use strict';


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
    	self.villano.hobbies.push(self.hobbieInput);
    	self.hobbieInput="";
    }
    
    this.seleccionarHobbie= function(hobbie){
    	self.hobbieSeleccionado=hobbie;
    }
    
    this.seleccionarSena= function(sena){
    	self.senaSeleccionada=sena;
    }
    
    this.deleteSena= function(){
    	var index= self.villano.senas_particulares.indexOf(self.senaSeleccionada);
    	self.villano.senas_particulares.splice(index,1);
    }
   
    this.deleteHobbie= function(){
    	var index= self.villano.hobbies.indexOf(self.hobbieSeleccionado);
    	self.villano.hobbies.splice(index,1);
    }
    
    this.addSena= function(){
    	self.villano.senas_particulares.push(self.senaInput);
    	self.senaInput="";
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
