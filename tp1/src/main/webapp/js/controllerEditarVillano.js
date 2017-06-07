app.controller('EditVillanoCtrl', function($resource, Villano, $state, $timeout, $stateParams) {

	'use strict';
	

    var self = this;
    self.senaInput="";
    self.hobbieInput="";


    function errorHandler(error) {
        self.notificarError(error.data);
    };
    
    this.getVillano=function(){
    	Villano.get({id: $stateParams.id},function(data){
    		self.villanoSeleccionado= data;
    	},errorHandler);
    };
    
    self.getVillano();

    this.guardarVillano= function() {
        Villano.update(this.villanoSeleccionado,{id:self.villanoSeleccionado.id}, function() {
            self.notificarMensaje('Villano actualizado!');
        }, errorHandler);

    };
    
    this.cancel= function(){
    	$state.go("expediente");
    }
    
    this.addHobbie= function(){
    	self.villanoSeleccionado.hobbies.push(self.hobbieInput);
    }
    
    this.addSena= function(){
    	self.villanoSeleccionado.senas_particulares.push(self.senaInput);
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
