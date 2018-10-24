import items.*
import minions.*
class Campeon{
	var property puntosDeVida 
	var property puntosDeAtaque
	var property bloqueos = 0
	var property puntosDeDanio = 0
	var property itemsEquipados = []
	var property estoyVivo = true
	
	method equipar(item){
		itemsEquipados.add(item)
		puntosDeVida += item.otorgarVida(self)
		puntosDeAtaque += item.otorgarAtaque(self)
		bloqueos += item.bloqueosAlEquipar()
		puntosDeDanio += item.otorgarDanio()
	}
	method desequipar(item){
		if(itemsEquipados.contains(item)){
			itemsEquipados.remove(item) 
			puntosDeVida -= item.otorgarVida(self) // la vida baja al desequipar
			puntosDeAtaque -= item.otorgarAtaque(self) // el ataque baja al desequipar
			puntosDeDanio += item.danioRecuperado()
			bloqueos += item.bloqueosAlDesequipar()
		}
	}
	method atacarA(enemigo){
		// solo si no hay bloqueos recibe danio
		puntosDeDanio += if(bloqueos>0) 0 else enemigo.defenderse()
		estoyVivo = puntosDeDanio >= puntosDeVida
		/*
		 * HP con el que empieza campeon = 50
		 * 12.5(-deHP) + 30 de danio + 15 (danio mobs) = 57.5
		 * por ende estoyVivo deberia dar false
		 */
	}
}