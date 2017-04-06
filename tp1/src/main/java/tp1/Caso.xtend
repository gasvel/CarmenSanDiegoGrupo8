package tp1

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Caso {
	
	Villano responsable;
	List<Pais> planDeEscape;
	String reporte;
	String objetoRobado;
	Pais lugarDeRobo;
	
	new(String reporteC, String objetoR){
		reporte = reporteC
		objetoRobado = objetoR
	}
	
	new(Villano villano, List<Pais> plan, Pais lugar){
		this.responsable = villano;
		this.planDeEscape = plan;
		this.lugarDeRobo = lugar;
	}
	
	new(Villano villano, List<Pais> plan, Pais lugar,String reporteC, String objetoR){
		this.responsable = villano;
		this.planDeEscape = plan;
		this.lugarDeRobo = lugar;
		reporte = reporteC
		objetoRobado = objetoR
	}
}