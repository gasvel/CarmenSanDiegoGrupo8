console.log("funco controller");
var app = angular.module('rickyApp',['ngResource','ui.router']).controller('JuegoCtrl', function($resource,$state,$stateParams ,UbicacionActual, CasoActual,Villanos, Inicio,Viajar,Paises) {
	console.log("funco controller0");

	'use strict';

    var self = this;
    

    self.villanos = [];
	self.casoActual =CasoActual;
	self.ubicacionActual = UbicacionActual;
	console.log(self.casoActual);
	console.log(self.ubicacionActual);



    

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
    
    
    this.iniciarJuego= function(){
    	console.log("inicio juego");
    	Inicio.save(function(data){
    		console.log(data);
    		self.casoActual.get =data;
    	},errorHandler);
    	$state.go('presentarCaso');
    };
    
    this.resolverMisterio= function(){
    	self.ubicacionActual.get = self.casoActual.get.pais;
    	$state.go('resolverMisterio');
    }

    
    
    this.viajarA= function(pais){
    	Viajar.viajar(pais);
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
