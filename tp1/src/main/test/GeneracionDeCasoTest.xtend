/* no funciona por el hecho de que los generar le pegan a los repos y no sabemos como inicializarlos

import static org.junit.Assert.*
import tp1.CarmenSanDiego
import appModel.AppModelPartida
import org.junit.Before
import org.junit.Test

class GeneracionDeCasoTest{
	
	CarmenSanDiego modelo
	AppModelPartida partida
	
	@Before
	def void init(){
		
		modelo = new CarmenSanDiego
		partida = modelo.generarPartida()
		
	}
	
	@Test
	def void testResponsableNotNull(){
				
		assertTrue(partida.casoActual.getResponsable()!=null)
	}
	
	@Test
	def void testGenerarPlanEscapeNotNull(){
		
		assertTrue(partida.casoActual.planDeEscape.size() != 0)
	}
}
*/