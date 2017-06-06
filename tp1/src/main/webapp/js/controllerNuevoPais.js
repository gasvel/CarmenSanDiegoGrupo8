app.controller('NuevoPaisCtrl', function($resource, Paises, Pais, $state, $stateParams) {

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
        Pais.save(this.nuevoPais, function(data) {
            self.notificarMensaje('Pais agregado con id:' + data.id);
            self.actualizarLista();
            self.nuevoPais = null;
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
    }

});