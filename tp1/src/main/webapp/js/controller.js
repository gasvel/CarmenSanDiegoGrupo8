app.controller('JuegoCtrl', function($resource, $timeout, cfpLoadingBar, Villanos, Paises) {
    'use strict';

    var self = this;

    self.villanos = [];

    function errorHandler(error) {
        self.notificarError(error.data);
    }

    this.actualizarLista = function() {
        Villanos.query(function(data) {
            self.villanos = data;
        }, errorHandler);
    };
    
    this.actualizarLista();

    // AGREGAR
    this.nuevoVillano = function() {
        Villanos.save(this.nuevoLibro, function(data) {
            self.notificarMensaje('Libro agregado con id:' + data.id);
            self.actualizarLista();
            self.nuevoLibro = null;
        }, errorHandler);
    };

    // ELIMINAR
    this.eliminar = function(libro) {
        
                Libros.remove(libro, function() {
                    self.notificarMensaje('Libro eliminado!');
                    self.actualizarLista();
                }, errorHandler);
 
     };

    // VER DETALLE
    this.libroSeleccionado = null;

    this.verDetalle = function(libro) {
        self.libroSeleccionado = libro;
        $("#verLibroModal").modal({});
    };

    // EDITAR LIBRO
    this.editarLibro = function(libro) {
    	self.libroSeleccionado = libro;
        $("#editarLibroModal").modal({});
    };

    this.guardarLibro = function() {
    	console.log(this.libroSeleccionado);
        Libros.update(this.libroSeleccionado, function() {
            self.notificarMensaje('Libro actualizado!');
            self.actualizarLista();
        }, errorHandler);

        this.libroSeleccionado = null;
        $("#editarLibroModal").modal('toggle');
    };

    // FEEDBACK & ERRORES
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
