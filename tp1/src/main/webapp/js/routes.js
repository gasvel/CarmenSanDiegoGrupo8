app.config(function ($stateProvider, $urlRouterProvider) {
console.log("ruta");
  $urlRouterProvider.otherwise("/");

  $stateProvider
  
  
  .state('main', {
      url: "/",
      templateUrl: "partials/pantallaTitulo.html",
      controller: "JuegoCtrl as juego"
    })

    .state('presentarCaso', {
      url: "/iniciarjuego",
      templateUrl: "partials/inicio.html",
  	controller: "JuegoCtrl as juego"
    })

    .state('resolverMisterio', {
      url: "/resolver",
      templateUrl: "partials/resolverMisterio.html",
  	controller: "ResolverMisterioCtrl as juego"

    })
    
    .state('expediente',{
    	url: "/villanos",
    	templateUrl: "partials/expedientes.html",
    	controller: "ExpedienteCtrl as ctrl"
    })
    
     .state('editarVillano',{
    	url: "/villano/:id",
    	params:{
    		id:null
    	},
    	templateUrl: "partials/editar_villano.html",
    	controller: "EditVillanoCtrl as ctrl"
    })
    
    .state('nuevoVillano',{
    	url: "/villano",
    	templateUrl: "partials/editar_villano.html",
    	controller: "NuevoVillanoCtrl as ctrl"
    })
    
    .state('mapamundi',{
    	url: "/paises",
    	templateUrl: "partials/mapamundi.html",
    	controller: "MapamundiCtrl as ctrl"
    })
    
    .state('nuevoPais',{
    	url: "/pais",
    	templateUrl: "partials/nuevo_pais.html",
    	controller: "NuevoPaisCtrl as ctrl"
    })
    
    
    
    .state('editarPais',{
    	url: "/pais/:id",
    	params: {
    		id: null
    	},
    	templateUrl: "partials/nuevo_pais.html",
    	controller: "EditarPaisCtrl as ctrl"
    })
    
    .state('editarCarac',{
    	url: "/pais/:id",
    	params: {
    		id: null
    	},
    	templateUrl: "partials/editar_carac.html",
    	controller: "EditarCaracCtrl as ctrl"
    })
    
    .state('editarConex',{
    	url: "/pais/:id",
    	params: {
    		id: null
    	},
    	templateUrl: "partials/editar_carac.html",
    	controller: "EditarConexCtrl as ctrl"
    })
    
    .state('editarLugaresDeInteres',{
    	url: "/pais/:id",
    	params: {
    		id: null
    	},
    	templateUrl: "partials/editar_carac.html",
    	controller: "EditarLugaresDeInteresCtrl as ctrl"
    })
    
    .state('editarConexNew',{
    	url: "/editarConexiones",
    	templateUrl: "partials/editar_carac.html",
    	controller: "NuevasConexCtrl as ctrl"
    })
    
    .state('editarLugaresDeInteresNew',{
    	url: "/EditarLugares",
    	templateUrl: "partials/editar_carac.html",
    	controller: "NuevosLugaresDeInteresCtrl as ctrl"
    })
    
    
     .state('emitirOrden',{
    	url: "/emitirOrden",
    	templateUrl: "partials/orden_de_arresto.html",
    	controller: "OrdenDeArrestoCtrl as ctrl"
    })
    
    .state('obtenerPista',{
    	url: "/pista",
    	templateUrl: "partials/pistaLugar.html",
    	controller: "PistaCtrl as ctrl"
    })
    
    .state('viajar',{
    	url: "/viajar",
    	templateUrl: "partials/viajar.html",
    	controller: "ViajeCtrl as ctrl"
    })

    	

});