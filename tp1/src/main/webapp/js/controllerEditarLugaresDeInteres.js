app.controller('EditarLugaresDeInteresCtrl', function($resource, Pais,PaisAEditar, $state,$timeout, $stateParams) {

	'use strict';

    var self = this;
    self.lugares= [{"nombre":"Banco"}, {"nombre":"Club" },{"nombre":"Embajada"},{"nombre":"Biblioteca"}];
    self.paisEditando=PaisAEditar;

    function errorHandler(error) {
        self.notificarError(error.data);
    };

    this.seleccionAAgregar= function(lugar){
    	self.lugarAAgregar= lugar;
    }
    
    this.seleccionar= function(lugar){
    	self.lugarAEliminar= lugar;
    }
    
    this.eliminarSeleccion= function(){
    	var index = self.paisEditando.get.lugares.indexOf(self.lugarAEliminar);
    	self.paisEditando.get.lugares.splice(index,1);
    }
    
    this.addSeleccion= function(){
    	self.paisEditando.get.lugares.push(self.lugarAEliminar);
    }
    
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
    
 
    
    this.guardar= function() {
    	if( $stateParams.id != null){
        Pais.update(this.paisEditando.get, function() {
            self.notificarMensaje('Pais actualizado!');
        }, errorHandler);
    	$state.go("editarPais",{id:$stateParams.id});

    	}
    	else{
    		$state.go("nuevoPais");
    	};

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