app.controller('EditarLugaresDeInteresCtrl', function($resource, Pais, $state,$timeout, $stateParams) {

	'use strict';

    var self = this;
    self.lugares= [{nombre:Banco}, {nombre:Club },{nombre:Embajada},{nombre:Biblioteca}];
    
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
    	self.paisSeleccionado.lugares.remove(self.lugarAEliminar);
    }
    
    this.addSeleccion= function(){
    	self.paisSeleccionado.lugares.push(self.lugarAEliminar);
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
    
    this.getPais=function(){
    	Pais.get({id: $stateParams.id},function(data){
    		self.paisSeleccionado= data;
    	},errorHandler);
    };
    
    self.getPais();
    this.guardar= function() {
        Pais.update(this.paisSeleccionado,{id:$stateParams.id}, function() {
            self.notificarMensaje('Pais actualizado!');
        }, errorHandler);

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