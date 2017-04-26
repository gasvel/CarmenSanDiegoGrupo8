import static org.junit.Assert.*
import java.util.ArrayList
import tp1.Villano
import org.junit.Before
import org.junit.Test
import excepciones.VillanoInvalidoException

class VillanoTest {
	
	Villano villano
	ArrayList<String> senias
	ArrayList<String> hobbies
	
	@Before
	def void init() {
		senias = new ArrayList<String>
		senias.add("Morocha")
		hobbies = new ArrayList<String>()
		hobbies.add("Navegar")
		villano = new Villano("Carmen", "Femenino", senias, hobbies)
	}
	
	@Test
	def void testVillanoSinNombreEsInvalido(){
		val pabloE = new Villano()
		val s = #["Narco", "Colombiano"]
		val h = #["Matar gente", "Vender droga"]
		pabloE.sexo = "Masculino"
		pabloE.senas_particulares = s
		pabloE.hobbies = h
		
		assertFalse(pabloE.esVillanoValido)
	}
	
	@Test
	def void testVillanoSinSexoEsInvalido(){
		val pabloE = new Villano()
		val s = #["Narco", "Colombiano"]
		val h = #["Matar gente", "Vender droga"]
		pabloE.nombre = "Pablo Escobar"
		pabloE.senas_particulares = s
		pabloE.hobbies = h
		
		assertFalse(pabloE.esVillanoValido)
	}
	
	@Test
	def void testVillanoSinSeniasEsInvalido(){
		val pabloE = new Villano()
		val h = #["Matar gente", "Vender droga"]
		pabloE.nombre = "Pablo Escobar"
		pabloE.sexo = "Masculino"
		pabloE.hobbies = h
		
		assertFalse(pabloE.esVillanoValido)
	}
	
	@Test
	def void testVillanoSinHobbiesEsInvalido(){
		val pabloE = new Villano()
		val s = #["Narco", "Colombiano"]
		pabloE.nombre = "Pablo Escobar"
		pabloE.sexo = "Masculino"
		pabloE.senas_particulares = s
	
		assertFalse(pabloE.esVillanoValido)
	}

	@Test
	def void testConNombreSexo1SeniasY1HobbiesNoEsVillanoValido() {
		assertFalse(villano.esVillanoValido)
	}
	
	@Test
	def void testConNombreSexo2SeniasY2HobbiesEsVillanoValido() {
		senias.add("Pata de palo")
		hobbies.add("Hablar con su loro")
		
		assertTrue(villano.esVillanoValido)
	}
	
	@Test
	def void testValidarVillanoInvalidoLanzaExcepcion(){
		val pepe = new Villano()
				
		try {
    		pepe.validar
  		} catch (VillanoInvalidoException e) {
  			println("Se lanzó la excepción esperada")
  		}
	}

}
