app.controller('MapamundiCtrl', function($resource , Paises,Pais, $state, $stateParams, $timeout) {

	'use strict';

    var self = this;

    self.paises = [];

    function errorHandler(error) {
        self.notificarError(error.data);
    }

    this.actualizarLista = function() {
        Paises.query(function(data) {
            self.paises = data;
        }, errorHandler);
    };
    this.actualizarLista();
    
    this.nuevoPais = function() {
    	$state.go("nuevoPais");
        
    };

    this.eliminarPais= function() {
       
                Pais.remove({id:self.paisSeleccionado.id}, function() {
                    self.notificarMensaje('Pais eliminado!');
                    self.actualizarLista();
                }, errorHandler);
 
     };
     

     this.seleccionarPais=function(pais){
    	 
    	  Pais.get({id: pais.id},function(data){
    	  	self.paisSeleccionado= data;
    	  },errorHandler);
    	
     };

    
    this.editarPais= function() {
    	$state.go("editarPais", {id: self.paisSeleccionado.id});
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
