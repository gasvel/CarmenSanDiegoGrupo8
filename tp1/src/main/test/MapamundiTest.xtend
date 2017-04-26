import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.Test;
import tp1.Mapamundi;
import tp1.Pais;
import java.util.ArrayList
import tp1.Lugar
import excepciones.PaisRepetidoException

class MapamundiTest {
	
	Mapamundi mapamundi
	Pais argentina
	Pais italia
	Pais japon

	@Before
	def void init() {
		mapamundi = new Mapamundi()		
		argentina = new Pais("Argentina", new ArrayList<String>(), new ArrayList<Lugar>())
		italia = new Pais("Italia", new ArrayList<String>(), new ArrayList<Lugar>())
		japon = new Pais("Japon", new ArrayList<String>(), new ArrayList<Lugar>())
	}

	@Test
	def void testInicioMapamundiSinPaises() {
		assertTrue(mapamundi.paises.empty)
	}
	
	@Test
	def void testAgregarPaisAMapamundi() {
		mapamundi.agregarPais(argentina)
		
		assertTrue(mapamundi.paises.contains(argentina))
		assertEquals(1, mapamundi.paises.size)
	}
	
	@Test
	def void testAgregarPaisRepetidoAMapamundiEsInvalido() {
		mapamundi.agregarPais(argentina)
		
		try{
			mapamundi.agregarPais(argentina)
			} catch(PaisRepetidoException e){
				println("Lanza excepción de país repetido")
			}
	}
	
	@Test
	def void testEliminarPaisDeMapamundi() {
		mapamundi.agregarPais(argentina)
		mapamundi.agregarPais(italia)
		mapamundi.agregarPais(japon)
		mapamundi.eliminarPais(italia)
		
		assertTrue(mapamundi.paises.contains(japon))
		assertTrue(mapamundi.paises.contains(argentina))				
		assertFalse(mapamundi.paises.contains(italia))

		assertEquals(2, mapamundi.getPaises().size())
	}
}