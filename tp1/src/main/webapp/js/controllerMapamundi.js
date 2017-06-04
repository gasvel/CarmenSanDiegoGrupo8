var app = angular.module('rickyApp',['ngResource']).controller('JuegoCtrl', function($resource , Paises) {

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
        Paises.save(this.nuevoPais, function(data) {
            self.notificarMensaje('Pais agregado con id:' + data.id);
            self.actualizarLista();
            self.nuevoPais = null;
        }, errorHandler);
    };

    this.eliminar = function(pais) {
        
                Paises.remove(pais, function() {
                    self.notificarMensaje('Pais eliminado!');
                    self.actualizarLista();
                }, errorHandler);
 
     };



    
    this.editarPais= function(pais) {
    	self.paisSeleccionado = pais;
    };

    this.guardarPais = function() {
        Paises.update(this.paisSeleccionado, function() {
            self.notificarMensaje('Pais actualizado!');
            self.actualizarLista();
        }, errorHandler);

        this.paisSeleccionado = null;
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
