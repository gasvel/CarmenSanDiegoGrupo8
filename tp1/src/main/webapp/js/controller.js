console.log("funco controller");
var app = angular.module('rickyApp',['ngResource','ui.router']).controller('JuegoCtrl', function($resource,$state,$stateParams ,UbicacionActual, CasoActual, Inicio) {
	console.log("funco controller0");

	'use strict';

    var self = this;
    

	self.casoActual =CasoActual;
	self.ubicacionActual = UbicacionActual;
	console.log(self.casoActual);
	console.log(self.ubicacionActual);



    

    function errorHandler(error) {
        self.notificarError(error.data);
    }

   
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