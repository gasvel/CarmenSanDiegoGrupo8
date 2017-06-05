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
  	controller: "JuegoCtrl as juego"

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

    	

});