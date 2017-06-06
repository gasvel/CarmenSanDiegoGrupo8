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
    
    .state('expedientes',{
    	url: "/villanos",
    	templateUrl: "partials/expedientes.html",
    	controller: "JuegoCtrl as ctrl"
    })
    
     .state('editarVillano',{
    	url: "/villanos/edicion",
    	templateUrl: "partials/editar_villano.html",
    	controller: "JuegoCtrl as ctrl"
    })
    
    .state('mapamundi',{
    	url: "/paises",
    	templateUrl: "partials/mapamundi.html",
    	controller: "MapamundiCtrl as ctrl"
    })
    
    .state('nuevoPais',{
    	url: "/paises/nuevo",
    	templateUrl: "partials/nuevo_pais.html",
    	controller: "NuevoPaisCtrl as ctrl"
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