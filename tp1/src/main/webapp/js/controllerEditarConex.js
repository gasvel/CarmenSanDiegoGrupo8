app.controller('EditarConexCtrl', function($resource, Pais,Paises,PaisAEditar, $state, $stateParams, $timeout) {

	'use strict';

    var self = this;
    
    self.paises=[];
    
    self.paisEditando=PaisAEditar;
    

    
    this.seleccionAAgregar= function(pais){
    	self.paisAAgregar= pais;
    }
    
    this.seleccionar= function(pais){
    	self.paisAEliminar= pais;
    }
    
    this.eliminarSeleccion= function(){
    	var index = self.paisEditando.get.conexiones.indexOf(self.paisAEliminar);
    	self.paisEditando.get.conexiones.splice(index,1);
    }
    
    this.addSeleccion= function(){
    	self.paisEditando.get.conexiones.push(self.paisAAgregar);
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
    
    
    this.guardar= function() {
    	if($stateParams.id != null){
    		console.log("esEditar");
    		Pais.update(this.paisEditando.get, function() {
                self.notificarMensaje('Pais actualizado!');
            }, errorHandler);
            $state.go("editarPais",{id:$stateParams.id})

    	}
    	else{
    		$state.go("nuevoPais");
    	};

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

app.controller('NuevasConexCtrl', function($resource, Pais,Paises,PaisAEditar, $state, $stateParams, $timeout) {

	'use strict';

    var self = this;
    
    self.paises=[];
    
    self.paisEditando=PaisAEditar;
    

    
    this.seleccionAAgregar= function(pais){
    	self.paisAAgregar= pais;
    }
    
    this.seleccionar= function(pais){
    	self.paisAEliminar= pais;
    }
    
    this.eliminarSeleccion= function(){
    	var index = self.paisEditando.get.conexiones.indexOf(self.paisAEliminar);
    	self.paisEditando.get.conexiones.splice(index,1);
    }
    
    this.addSeleccion= function(){
    	self.paisEditando.get.conexiones.push(self.paisAAgregar);
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
    
    
    this.guardar= function() {
    	if($stateParams.id != null){
    		console.log("esEditar");
    		Pais.update(this.paisEditando.get, function() {
                self.notificarMensaje('Pais actualizado!');
            }, errorHandler);
            $state.go("editarPais",{id:$stateParams.id})

    	}
    	else{
    		$state.go("nuevoPais");
    	};

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
