package test;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import tp1.Lugar;
import tp1.Mapamundi;
import tp1.Pais;

public class MapamundiTest {
	
	private Mapamundi mapamundi;
	private Pais argentina;
	private Pais italia;
	private Pais japon;

	@Before
	public void setUp() throws Exception {
		mapamundi = new Mapamundi();
		//argentina = new Pais("Argentina", new ArrayList<String>(), new ArrayList<Lugar>(), new ArrayList<Pais>());
		//italia = new Pais("Italia", new ArrayList<String>(), new ArrayList<Lugar>(), new ArrayList<Pais>());
		//japon = new Pais("Japon", new ArrayList<String>(), new ArrayList<Lugar>(), new ArrayList<Pais>());
	}

	@Test
	public void testInicioMapamundiSinPaises() {
		assertTrue(mapamundi.getPaises().isEmpty());
	}
	
	@Test
	public void testAgregarPaisDeMapamundi() {
		mapamundi.agregarPais(argentina);
		assertTrue(mapamundi.getPaises().contains(argentina));
		assertEquals(1, mapamundi.getPaises().size());
	}
	
	@Test
	public void testEliminarPaisDeMapamundi() {
		mapamundi.agregarPais(argentina);
		mapamundi.agregarPais(italia);
		mapamundi.agregarPais(japon);
		mapamundi.eliminarPais(italia);
		
		assertFalse(mapamundi.getPaises().contains(italia));
		assertTrue(mapamundi.getPaises().contains(japon));
		assertTrue(mapamundi.getPaises().contains(argentina));
		assertEquals(2, mapamundi.getPaises().size());
	}
}