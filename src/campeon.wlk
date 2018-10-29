import items.*
import minions.*
class Campeon{
	const vidaBase = 0
	var property vidaExtra = 0
	const ataqueBase = 0
	var property ataqueExtra = 0
	var property bloqueos = 0
	var property puntosDeDanio = 0
	var property itemsEquipados = []
	var dinero = 0
	
	method comprar(item){
		if(dinero>= item.precio()){
			self.equipar(item)
			dinero -= item.precio()
		}
	}
	method vender(item){
		if(itemsEquipados.contains(item)){
			self.desequipar(item)
			dinero += item.precio() / 2
		}
	}
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
		if (bloqueos > 0) {bloqueos -= 1} 
		else {puntosDeDanio += enemigo.defenderse()}
		enemigo.recibirAtaque(self.ataque())
	}
}