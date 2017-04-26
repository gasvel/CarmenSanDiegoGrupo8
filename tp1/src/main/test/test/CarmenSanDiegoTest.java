package test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;
import org.junit.Before;
import org.junit.Test;

import tp1.CarmenSanDiego;
import tp1.Lugar;
import tp1.Pais;
import tp1.Villano;

public class CarmenSanDiegoTest {
	
	private CarmenSanDiego juego;
	private ArrayList<Villano> villanos;
	private ArrayList<Pais> mapamundi;
	private Villano villano1;
	private Villano villano2;
	private Pais argentina;
	

	@Before
	public void setUp() throws Exception {
		juego = new CarmenSanDiego();
		villanos = new ArrayList<Villano>();
		mapamundi = new ArrayList<Pais>();
		villano1 = new Villano("Diego", "Masculino", new ArrayList<String>(), new ArrayList<String>());
		villano2 = new Villano("Moria", "Femenino", new ArrayList<String>(), new ArrayList<String>());
		juego.agregarVillano(villano1);
		juego.agregarVillano(villano2);

		//argentina = new Pais("Argentina",);
		//List<String> caracteristicasP, List<Lugar> lugares, List<Pais> paises
	}

	@Test
	public void testAgregarNuevoPais() {
		//juego.agregarNuevoPais(argentina);
		
	}

}
