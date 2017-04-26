import appModel.AppModelPartida;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import tp1.CarmenSanDiego;
import tp1.Caso;
import tp1.Lugar;
import tp1.Pais;
import tp1.Villano;

@SuppressWarnings("all")
public class TestViajar {
  private AppModelPartida partida;
  
  private CarmenSanDiego modelo;
  
  private Pais chile;
  
  private Pais brasil;
  
  private Pais argentina;
  
  @Before
  public void init() {
    ArrayList<String> _arrayList = new ArrayList<String>();
    ArrayList<String> _arrayList_1 = new ArrayList<String>();
    final Villano villano = new Villano("Carmen San Diego", "femenino", _arrayList, _arrayList_1);
    ArrayList<String> _arrayList_2 = new ArrayList<String>();
    ArrayList<Lugar> _arrayList_3 = new ArrayList<Lugar>();
    Pais _pais = new Pais("Argentina", _arrayList_2, _arrayList_3);
    this.argentina = _pais;
    ArrayList<String> _arrayList_4 = new ArrayList<String>();
    ArrayList<Lugar> _arrayList_5 = new ArrayList<Lugar>();
    Pais _pais_1 = new Pais("Chile", _arrayList_4, _arrayList_5);
    this.chile = _pais_1;
    ArrayList<String> _arrayList_6 = new ArrayList<String>();
    ArrayList<Lugar> _arrayList_7 = new ArrayList<Lugar>();
    Pais _pais_2 = new Pais("Chile", _arrayList_6, _arrayList_7);
    this.brasil = _pais_2;
    final ArrayList<Pais> planEscape = new ArrayList<Pais>();
    planEscape.add(this.chile);
    final Caso caso = new Caso(villano, planEscape, this.argentina, "algo");
    CarmenSanDiego _carmenSanDiego = new CarmenSanDiego();
    this.modelo = _carmenSanDiego;
    AppModelPartida _appModelPartida = new AppModelPartida(this.modelo, caso);
    this.partida = _appModelPartida;
  }
  
  @Test
  public void testActualizarUbicacion() {
    this.partida.setDestinoElegido(this.chile);
    this.partida.actualizarUbicacion();
    Pais _ubicacionActual = this.partida.getUbicacionActual();
    Assert.assertEquals(_ubicacionActual, this.chile);
    List<Pais> _recorrido = this.partida.getRecorrido();
    Pais _last = IterableExtensions.<Pais>last(_recorrido);
    Assert.assertEquals(_last, this.argentina);
    this.partida.setDestinoElegido(this.brasil);
    this.partida.actualizarUbicacion();
    Pais _ubicacionActual_1 = this.partida.getUbicacionActual();
    Assert.assertEquals(_ubicacionActual_1, this.brasil);
    List<Pais> _recorrido_1 = this.partida.getRecorrido();
    Pais _last_1 = IterableExtensions.<Pais>last(_recorrido_1);
    Assert.assertEquals(_last_1, this.chile);
  }
}
