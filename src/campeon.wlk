import items.*
import minions.*
class Campeon{
	const vidaBase = 0
	var property vidaExtra = 0
	const ataqueBase = 0
	var property ataqueExtra = 0
	var property bloqueos = 0
	var property puntosDeDanio = 0
	var itemsEquipados = []
	var property dinero = 0
	
	method activarHabilidadEspecial(item){
		if (self.inventario().contains(item)){
			item.habilidadActivable(self)
		}
	}
	
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
	
	method inventario() {
		return itemsEquipados
	}
	
	method amplificacionVida() {
		return self.inventario().map({item => item.amplificarVida(self)}).sum()
		
	}

	method amplificacionAtaque(){
		return self.inventario().map({item => item.amplificarAtaque(self)}).sum()
	}
	
	method recibirHP(aumentoDeVida){vidaExtra += aumentoDeVida}
	method recibirATK(aumentoDeAtaque){ataqueExtra += aumentoDeAtaque}
	method recibirDMG(cantidadDeDanio){
			puntosDeDanio = (puntosDeDanio + cantidadDeDanio).max(0)
	}
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
		// Modificado para la parte de dinero de la P2 del enunciado
		// no se si funciona
		bloqueos -= if(not enemigo.estoyVivo())  0 else  1
		puntosDeDanio += if(self.bloqueos()>0)  0 else  enemigo.defenderse()
		dinero += if(self.ataque() > enemigo.cantidadDeMinions()) enemigo.cantidadDeMinions() else self.ataque()
		enemigo.recibirAtaque(self.ataque())
	}
}








