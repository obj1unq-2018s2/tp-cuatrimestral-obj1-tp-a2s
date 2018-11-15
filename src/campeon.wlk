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
		else {
			throw new Exception("No hay ningun" + item.toString() + "en el inventario")
		}
	}
	
	method comprar(item){
		if(dinero >= item.precio()){
			self.equipar(item)
			dinero -= item.precio()
		} else {
			throw new Exception("Dinero insuficiente")
		}
		// TODO Debería tirar excepción.
	}
	
	method vender(item){
		if(itemsEquipados.contains(item)){
			self.desequipar(item)
			dinero += item.precio() / 2
		} else {
			throw new Exception("No hay ningun" + item.toString() + "en el inventario")
		}
		// TODO Debería tirar excepción.
	}
	
	method inventario() {
		return itemsEquipados
	}
	
	method amplificacionVida() {
		return self.inventario().sum{
			item => item.amplificarVida(self)
		}
		
	}

	method amplificacionAtaque(){
		return self.inventario().map{
			item => item.amplificarAtaque(self)
		}.sum()
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
		// TODO Sería mejor tener el chequeo de estoy vivo guardando todo lo demás.
//		bloqueos -= if(not enemigo.estoyVivo())  0 else  1

		// TODO No debería descontarme el bloqueo antes de chequear.
//		puntosDeDanio += if(bloqueos > 0)  0 else  enemigo.defenderse()

		// TODO Me gustaría que aparezca la cantidad de minions que se mueren porque se usa dos veces.
//		dinero += if(self.ataque() > enemigo.cantidadDeMinions()) enemigo.cantidadDeMinions() else self.ataque()
//		enemigo.recibirAtaque(self.ataque())

		if (enemigo.estoyVivo()) {
			puntosDeDanio += if (bloqueos > 0) 0 else enemigo.defenderse() //Sólo recibe daño si no tiene bloqueos
			bloqueos = (bloqueos - 1).max(0) //Resta bloqueos en cada ataque, excepto si no tiene ninguno
			dinero += enemigo.minionsQueMueren(self.ataque()) //Recibe tanto dinero como minions mate su ataque
			enemigo.recibirAtaque(self.ataque()) //Por último la oleada recibe el ataque
		}
	}
}








