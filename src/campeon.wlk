import items.*
import minions.*
class Campeon{
	var property puntosDeVida 
	var property puntosDeAtaque
	var property bloqueos = 0
	var property puntosDeDanio = 0
	var property itemsEquipados = []
	
	method recibirHP(aumentoDeVida){puntosDeVida += aumentoDeVida}
	method recibirATK(aumentoDeAtaque){puntosDeAtaque += aumentoDeAtaque}
	method recibirDMG(cantidadDeDanio){puntosDeDanio += cantidadDeDanio}
	method recibirBloqueos(cantidadDeBloqueos){bloqueos += cantidadDeBloqueos}
	
	method estoyVivo() = puntosDeVida > puntosDeDanio
	
	method equipar(item){
		item.serEquipado(self)
		itemsEquipados.add(item)
	}
	
	method desequipar(item){
		item.serDesequipado(self)
		itemsEquipados.remove(item)
	}

	method atacarA(enemigo){
		puntosDeDanio += if(bloqueos>0) 0 else enemigo.defenderse()
	}
}