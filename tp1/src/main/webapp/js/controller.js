console.log("funco controller");
var app = angular.module('rickyApp',['ngResource']).controller('JuegoCtrl', function($resource , Villanos) {
	console.log("funco controller0");

	'use strict';

    var self = this;
    
    console.log("funco controller1");

    self.villanos = [];

    function errorHandler(error) {
        self.notificarError(error.data);
    }

    this.actualizarLista = function() {
        Villanos.query(function(data) {
        	console.log(data);
            self.villanos = data;
        }, errorHandler);
    };
    console.log("funco");
    this.actualizarLista();
    
    console.log("funco controller2");
    
    this.nuevoVillano = function() {
        Villanos.save(this.nuevoVillano, function(data) {
            self.notificarMensaje('Villano agregado con id:' + data.id);
            self.actualizarLista();
            self.nuevoVillano = null;
        }, errorHandler);
    };

    this.eliminar = function(villano) {
        
                Villanos.remove(villano, function() {
                    self.notificarMensaje('Villano eliminado!');
                    self.actualizarLista();
                }, errorHandler);
 
     };



    
    this.editarVillano= function(villano) {
    	self.villanoSeleccionado = villano;
    };

    this.guardarVillano = function() {
    	console.log(this.villanoSeleccionado);
        Villanos.update(this.villanoSeleccionado, function() {
            self.notificarMensaje('Villano actualizado!');
            self.actualizarLista();
        }, errorHandler);

        this.villanoSeleccionado = null;
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
