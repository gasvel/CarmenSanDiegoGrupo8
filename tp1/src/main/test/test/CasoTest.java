package test;

import static org.junit.Assert.*;
import java.util.ArrayList;
import org.junit.Before;
import org.junit.Test;
import tp1.Caso;
import tp1.Lugar;
import tp1.Pais;
import tp1.Villano;

public class CasoTest {
	
	private Caso caso;
	private Villano villano;
	private ArrayList<Pais> planDeEscape;
	private String reporte;
	private String objetoRobado;
	private Pais lugarDeRobo;
	
	@Before
	public void setUp() throws Exception {
		villano = new Villano("Carmen", "Femenino", new ArrayList<String>(), new ArrayList<String>());
		planDeEscape = new ArrayList<>();
		reporte = "Este es un reporte";
		objetoRobado = "Diamante de jade";
		//lugarDeRobo = new Pais("Argentina", new ArrayList<String>(), new ArrayList<Lugar>(), new ArrayList<Pais>());
	}


}