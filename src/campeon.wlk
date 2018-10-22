import items.*
import minions.*
class Campeon{
	var property puntosDeVida 
	var property puntosDeAtaque
	var property bloqueos
	var property puntosDeDanio = 0
	var itemsEquipados = []
	
	method equipar(item){
		itemsEquipados.add(item)
		puntosDeVida += item.otorgarVida()
		puntosDeAtaque += item.otorgarAtaque()
		bloqueos += item.otorgarBloqueos()
		puntosDeDanio += item.otorgarDanio()
	}
	method desequipar(item){
		if(itemsEquipados.contains(item)){
			itemsEquipados.remove(item) 
			puntosDeDanio -= item.danioRecuperado()
			bloqueos += item.recuperarBloqueos()
		}
	}
	method atacar(){
		puntosDeDanio += minions.defenderse()
	}
}