import static org.junit.Assert.*;
import org.junit.Before
import org.junit.Test
import appModel.AppModelPartida
import tp1.CarmenSanDiego
import tp1.Caso
import java.util.ArrayList
import tp1.Villano
import tp1.Pais
import tp1.Lugar

class TestViajar {
	
	AppModelPartida partida
	CarmenSanDiego modelo
	Pais chile
	Pais brasil
	Pais argentina
	
	@Before
	def void init(){
		
		val villano = new Villano("Carmen San Diego","femenino",new ArrayList<String>, new ArrayList<String>)
		argentina = new Pais("Argentina",new ArrayList<String>,new ArrayList<Lugar>)
		chile = new Pais("Chile",new ArrayList<String>,new ArrayList<Lugar>)
		brasil = new Pais("Chile",new ArrayList<String>,new ArrayList<Lugar>)
		val planEscape = new ArrayList<Pais>
		planEscape.add(chile)
		val caso = new Caso(villano, planEscape, argentina ,"algo")
		
		modelo = new CarmenSanDiego
		partida = new AppModelPartida(modelo, caso)
	}
	
	@Test
	def void testActualizarUbicacion(){
		
		
		partida.destinoElegido = chile
		partida.actualizarUbicacion()
		assertEquals(partida.ubicacionActual, chile)
		assertEquals(partida.recorrido.last(), argentina)
		
		partida.destinoElegido = brasil
		partida.actualizarUbicacion()
		
		assertEquals(partida.ubicacionActual, brasil)
		assertEquals(partida.recorrido.last(), chile)

	}
}