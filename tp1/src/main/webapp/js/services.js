app.factory('Villanos', function($resource) {
    return $resource('/villanos/:id', {'id': '@id'}, {
    	'query': { method: 'GET', isArray: true},
        'update': { method: 'PUT' },
        'save': { method: 'POST' },
        'remove': { method:'DELETE' }
    });
});

console.log("funco services1");

app.factory('Paises', function($resource) {
    return $resource('/paises', {
    	'query': { method: 'GET', isArray: true}

    });
});

app.factory('Pais', function($resource) {
    return $resource('/pais/:id', {'id': '@id'}, {
    	'get': { method: 'GET'},
        'update': { method: 'PUT' },
        'save': { method: 'POST' },
        'remove': { method:'DELETE' }
    });
});



app.factory('Inicio', function($resource) {
    return $resource('/iniciarjuego', {
        'save': { method: 'POST' }

    });
});

app.factory('Viajar', function($resource) {
    return $resource('/viajar/:destinoId', {'destinoId': '@destinoId'}, {

        'viajar': { method: 'POST' }

    });
});

app.factory('Orden', function($resource) {
    return $resource('/emitirOrdenPara/:villanoId/:casoId', {'villanoId': '@villanoId'}, {'casoId':'@casoId'}, {
        'emitirOrden': { method: 'POST' }

    });
});



app.factory('Pista', function($resource) {
    return $resource('/pistaDelLugar/:lugar/:casoId', {'lugar': '@lugar'},{'casoId' : '@casoId'}, {
    	'obtenerPista': { method: 'GET', isArray: false},
    });
});

app.service('CasoActual',function Caso(){
	var casoActual=this;
	casoActual.get=null;
	});

app.service('UbicacionActual',function Ubicacion(){
	var ubicacionActual=this;
	ubicacionActual.get=null;
	});



console.log("funco services2");
