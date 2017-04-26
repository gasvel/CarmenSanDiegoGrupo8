package test;

import static org.junit.Assert.*;
import java.util.ArrayList;
import org.junit.Before;
import org.junit.Test;
import tp1.Villano;

public class VillanoTest {
	
	private Villano villano;
	private ArrayList<String> senias;
	private ArrayList<String> hobbies;
	
	@Before
	public void setUp() throws Exception {
		senias = new ArrayList<String>();
		senias.add("morocha");
		hobbies = new ArrayList<String>();
		hobbies.add("Navegar");
		villano = new Villano("Carmen", "Femenino", senias, hobbies);
	}

	@Test
	public void testInicialziarVillano() {
		assertEquals("Carmen", villano.getNombre());
		assertEquals("Femenino", villano.getSexo());
		assertTrue(villano.getSenas_particulares().contains("morocha"));
		assertTrue(villano.getHobbies().contains("Navegar"));
	}

}
