package service

import tp1.RepoPreguntas
import tp1.Respuesta
import java.util.ArrayList

class DataService {
	
	RepoPreguntas preguntas
	
	new(RepoPreguntas repo){
		preguntas = repo
	}
	
	def randomWithRange(int min, int max)
	{
   		val range = (max - min) + 1  
   		return (((Math.random() * range) + min) as int)
	}
	
	def setPreguntasIniciales(){
		var resps = new ArrayList<Respuesta>()
		val resp = new Respuesta(1, "Valencia")
		val resp2 =  new Respuesta(2, "Malaga")
		val resp3 =  new Respuesta(3, "Real Madrid")
		resps.add(resp)
		resps.add(resp2)
		resps.add(resp3)
		
		var resps2 = new ArrayList<Respuesta>()
		val resp4 =  new Respuesta(4, "Dusanbé")
		val resp5 =  new Respuesta(5, "Biskek")
		val resp6 =  new Respuesta(6, "Taskent")
		resps2.add(resp4)
		resps2.add(resp5)
		resps2.add(resp6)
		
		var resps3 = new ArrayList<Respuesta>()
		val resp7 =  new Respuesta(7, "La Cupula")
		val resp8 =  new Respuesta(8, "El gato negro")
		val resp9 =  new Respuesta(9, "Duma Key")
		resps3.add(resp7)
		resps3.add(resp8)
		resps3.add(resp9)
		
		var resps4 = new ArrayList<Respuesta>()
		val resp10 =  new Respuesta(10, "38")
		val resp11 =  new Respuesta(11, "24")
		val resp12 =  new Respuesta(12, "32")
		resps4.add(resp10)
		resps4.add(resp11)
		resps4.add(resp12)
		
		var resps5 = new ArrayList<Respuesta>()
		val resp13 =  new Respuesta(13, "Martin Palermo")
		val resp14 =  new Respuesta(14, "Angel Labruna")
		val resp15 =  new Respuesta(15, "Arsenio Erico")
		resps5.add(resp13)
		resps5.add(resp14)
		resps5.add(resp15)
		
		var resps6 = new ArrayList<Respuesta>()
		val resp16 =  new Respuesta(16, "Benin")
		val resp17 =  new Respuesta(17, "Mongolia")
		val resp18 =  new Respuesta(18, "Kazajistan")
		resps6.add(resp16)
		resps6.add(resp17)
		resps6.add(resp18)
		
		var resps7 = new ArrayList<Respuesta>()
		val resp19 =  new Respuesta(19, "Walt Withman")
		val resp20 =  new Respuesta(20, "Helman Melville")
		val resp21 =  new Respuesta(21, "Charles Dickens")
		resps7.add(resp19)
		resps7.add(resp20)
		resps7.add(resp21)
		
		var resps8 = new ArrayList<Respuesta>()
		val resp22 =  new Respuesta(22, "6")
		val resp23 =  new Respuesta(23, "21")
		val resp24 =  new Respuesta(24, "0")
		resps8.add(resp22)
		resps8.add(resp23)
		resps8.add(resp24)
		
		var resps9 = new ArrayList<Respuesta>()
		val resp25 =  new Respuesta(25, "Landon Donovan")
		val resp26 =  new Respuesta(26, "Jaime Moreno")
		val resp27 =  new Respuesta(27, "Carlos Ruiz")
		resps9.add(resp25)
		resps9.add(resp26)
		resps9.add(resp27)
		
		var resps10 = new ArrayList<Respuesta>()
		val resp28 =  new Respuesta(28, "Alemania")
		val resp29 =  new Respuesta(29, "Portugual")
		val resp30 =  new Respuesta(30, "Inglaterra")
		resps10.add(resp28)
		resps10.add(resp29)
		resps10.add(resp30)
		
		var resps11 = new ArrayList<Respuesta>()
		val resp31 =  new Respuesta(31, "XIV")
		val resp32 =  new Respuesta(32, "XVI")
		val resp33 =  new Respuesta(33, "XVII")
		resps11.add(resp31)
		resps11.add(resp32)
		resps11.add(resp33)
		
		var resps12 = new ArrayList<Respuesta>()
		val resp34 =  new Respuesta(34, "100")
		val resp35 =  new Respuesta(35, "99")
		val resp36 =  new Respuesta(36, "101")
		resps12.add(resp34)
		resps12.add(resp35)
		resps12.add(resp36)
		
		preguntas.create("En que equipo debuto el futbolista Isco Alarcon?",resps,1,"Deportes")
		preguntas.create("Cual es la capital de Uzbekistan?",resps2,6,"Geografia")
		preguntas.create("Cual de estos libros no fue escrito por Stephen King?",resps3,8,"Literatura")
		preguntas.create("Cuanto es 4x5 + 6x4 - 12 ?",resps4,12,"Matematicas")
		preguntas.create("Quien es el maximo goleador de la historia del futbol argentino?",resps5,15,"Deportes")
		preguntas.create("De que pais es capital nacional Ulaanbaatar?",resps6,17,"Geografia")
		preguntas.create("Quien escribio Moby Dick?",resps7,20,"Literatura")
		preguntas.create("Cual es el resultado de (3x7x(24/4)x0)/6?",resps8,24,"Matematicas")
		preguntas.create("Quien es el maximo goleador de la historia de la MLS?",resps9,25,"Deportes")
		preguntas.create("Cual de estos paises limita con España?",resps10,29,"Geografia")
		preguntas.create("En que siglo nacio Miguel de Cervantes?",resps11,32,"Literatura")
		preguntas.create("Cuanto es (999 - 99 + 9) / 9 ? ",resps12,36,"Matematicas")
 
		
		
		
	}
}