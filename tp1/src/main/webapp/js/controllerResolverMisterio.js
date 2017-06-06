app.controller('ResolverMisterioCtrl', function($resource,$state,$stateParams ,UbicacionActual, CasoActual,LugarVisitado, Inicio) {
	console.log("funco controller0");

	'use strict';

    var self = this;
    

	self.ubicacionActual = UbicacionActual;
	self.lugar= LugarVisitado;
	console.log(self.ubicacionActual);



    

    function errorHandler(error) {
        self.notificarError(error.data);
    }

   

    this.irALugar= function(lugar){
    	self.lugar.get=lugar;
    	$state.go("obtenerPista");
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
