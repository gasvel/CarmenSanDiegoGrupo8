app.controller('EditVillanoCtrl', function($resource, Villano, $state, $timeout, $stateParams) {

	'use strict';
	

    var self = this;
   
    self.senaInput="";
    self.hobbieInput="";
    self.villano={};


    function errorHandler(error) {
        self.notificarError(error.data);
    };
    
    this.getVillano=function(){
    	Villano.get({id: $stateParams.id},function(data){
    		console.log(data);
    		self.villanoSel= data;
    		self.villano.id= self.villanoSel.id;
    		self.villano.nombre= self.villanoSel.nombre;
    	    self.villano.sexo= self.villanoSel.sexo;
    	    self.villano.hobbies= self.villanoSel.hobbies;
    	    self.villano.senas_particulares= self.villanoSel.senas_particulares;
    		
    	},errorHandler);
    };
    
    this.getVillano();
    
 

    this.guardarVillano= function() {
 
    	console.log(this.villanoSel);
        Villano.update(this.villano, function() {
            self.notificarMensaje('Villano actualizado!');
            $state.go("expediente");
        }, errorHandler);

    };
    
    this.cancel= function(){
    	$state.go("expediente");
    }
    
    this.addHobbie= function(){
    	self.villano.hobbies.push(self.hobbieInput);
    	self.hobbieInput="";
    }
    
    this.addSena= function(){
    	self.villano.senas_particulares.push(self.senaInput);
    	self.senaInput="";
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
