app.controller('EditarConexCtrl', function($resource, Pais,Paises, $state, $stateParams, $timeout) {

	'use strict';

    var self = this;
    
    self.paises=[];
    
    this.seleccionAAgregar= function(pais){
    	self.paisAAgregar= pais;
    }
    
    this.seleccionar= function(pais){
    	self.paisAEliminar= pais;
    }
    
    this.eliminarSeleccion= function(){
    	self.paisSeleccionado.conexiones.remove(self.lugarAEliminar);
    }
    
    this.addSeleccion= function(){
    	self.paisSeleccionado.conexiones.push(self.lugarAEliminar);
    }
    
    function errorHandler(error) {
        self.notificarError(error.data);
    };
    
    this.actualizarLista = function() {
        Paises.query(function(data) {
            self.paises = data;
        }, errorHandler);
    };
    this.actualizarLista();

    
    this.esCarac= function(){
    	return false;
    }
    
    this.esConex= function(){
    	return true;
    }
    
    this.esLugaresDeInteres= function(){
    	return false;
    }

    this.cancel= function(){
    	$state.go("nuevoPais");
    }
    
    this.getPais=function(){
    	Pais.get({id: $stateParams.id},function(data){
    		self.paisSeleccionado= data;
    	},errorHandler);
    };
    
    self.getPais();
    
    this.guardar= function() {
        Pais.update(this.paisSeleccionado,{id: $stateParams.id}, function() {
            self.notificarMensaje('Pais actualizado!');
        }, errorHandler);

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
    };

});
