package test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import tp1.Lugar;
import tp1.Pais;

public class PaisTest {
	
	private Pais colombia;
	private List<String> caracteristicas;
	private List<Lugar> lugares;
	private List<Pais> paises;

	@Before
	public void setUp() throws Exception {
		caracteristicas = new ArrayList<String>();
		caracteristicas.add("Drogas");
		caracteristicas.add("Shakira");
		lugares = new ArrayList<Lugar>();
		paises = new ArrayList<Pais>();
		//colombia = new Pais("Colombia", caracteristicas, lugares, paises);
	}

	@Test
	public void testInicializarUnPais() {
		assertEquals("Colombia", colombia.getNombre());
		assertTrue(colombia.getCaracteristicas().contains("Drogas"));
		assertTrue(colombia.getCaracteristicas().contains("Shakira"));
		assertTrue(colombia.getLugaresDeInteres().isEmpty());
		assertTrue(colombia.getConexiones().isEmpty());
	}

}
