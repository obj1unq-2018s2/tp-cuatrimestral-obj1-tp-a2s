import items.*
import minions.*
class Campeon{
	const vidaBase
	var property vidaExtra = 0
	const ataqueBase
	var property ataqueExtra = 0
	//divido vida y ataque en base y extra, porque de otro modo se pierde el valor asignado al crear la instancia.
	//Es necesario recordarlo para poder restablecer al campeón al desequipar un item.
	var property bloqueos = 0
	var property puntosDeDanio = 0
	var property itemsEquipados = []
	
	method amplificacionVida() {
		return itemsEquipados.map({item => item.amplificarVida(self)}).sum()
		
	}

	method amplificacionAtaque(){
		return itemsEquipados.map({item => item.amplificarAtaque(self)}).sum()
	}
	//Estos dos métodos amplifican vida y ataque según los métodos de cada item equipado.
	
	
	method recibirHP(aumentoDeVida){vidaExtra += aumentoDeVida}
	method recibirATK(aumentoDeAtaque){ataqueExtra += aumentoDeAtaque}
	method recibirDMG(cantidadDeDanio){puntosDeDanio += cantidadDeDanio}
	method recibirBloqueos(cantidadDeBloqueos){bloqueos += cantidadDeBloqueos}
	
	method ataque(){
		return ataqueBase + ataqueExtra + self.amplificacionAtaque()
	}
	method vida() {
		return vidaBase + vidaExtra + self.amplificacionVida()
	}
	//El valor final de vida y ataque es igual al valor base + extra + la amplificación que aplique a cada uno según
	//los items que el campeon tenga equipados.
	
	method estoyVivo() = self.vida() > puntosDeDanio
	
	method equipar(item){
		item.serEquipado(self)
		itemsEquipados.add(item)
	}
	
	method desequipar(item){
		item.serDesequipado(self)
		itemsEquipados.remove(item)
	}

	method atacarA(enemigo){
		//puntosDeDanio += if(bloqueos>0) 0 else enemigo.defenderse()
		//Esto lo reescribo porque cada defensa de oleada debería restar un bloqueo.
		//Faltaba además agregar el daño provocado por la defensa de la oleada.
		
		if (bloqueos > 0) {bloqueos -= 1} 
		else {puntosDeDanio += enemigo.defenderse()}
	}
}