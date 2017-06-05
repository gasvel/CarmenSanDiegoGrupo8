import static org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import appModel.AppModelPartida
import tp1.CarmenSanDiego
import tp1.Caso
import java.util.ArrayList
import tp1.Villano
import tp1.Pais
import tp1.Lugar

class OrdenDeArrestoTest {
	
	AppModelPartida partida
	CarmenSanDiego modelo
	Pais chile
	Pais argentina
	Villano responsable
	
	@Before
	def void init(){
		
		responsable = new Villano("Carmen San Diego","femenino",new ArrayList<String>, new ArrayList<String>)
		argentina = new Pais("Argentina",new ArrayList<String>,new ArrayList<Lugar>)
		chile = new Pais("Chile",new ArrayList<String>,new ArrayList<Lugar>)
		val planEscape = new ArrayList<Pais>
		planEscape.add(chile)
		val caso = new Caso(responsable, planEscape, argentina ,"algo")
		
		modelo = new CarmenSanDiego
		partida = new AppModelPartida(modelo, caso)
	}
	
	@Test
	def void testOrdenDeArrestoAVillanoIncorrecto(){
		
		val villano = new Villano("Ramon San Diego","masculino",new ArrayList<String>, new ArrayList<String>)
		partida.nuevaOrdenDeArresto(villano)
		partida.destinoElegido = chile
		partida.actualizarUbicacion()
		assertTrue(partida.generoOrdenDeArresto)
		assertTrue(!partida.villanoAtrapadoCorrecto)


	}
	
	def void testNoGeneroOrdenDeArresto(){
		partida.destinoElegido = chile
		partida.actualizarUbicacion()
		assertTrue(!partida.generoOrdenDeArresto)
	}
	
	
	def void testOrdenDeArrestoExitosa(){
		partida.nuevaOrdenDeArresto(responsable)
		partida.destinoElegido = chile
		partida.actualizarUbicacion()
		assertTrue(partida.villanoAtrapadoCorrecto)
	}
}