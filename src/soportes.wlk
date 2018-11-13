import items.*
import campeon.*
import minions.*

class Soporte inherits Campeon {
	var property vinculo = null // Un campeón
	
	method vincularCon(campeon) {
		vinculo = campeon
	}
	
	method desvincular(){
		vinculo = null
	}
	
	method estaVinculado(){
		return vinculo !== null
	}
	
	override method inventario(){

		return super() + if (self.estaVinculado()) {vinculo.inventario()} else []
	}
	
	override method atacarA(enemigo){
		if (self.estaVinculado()){
			super(enemigo)
			vinculo.puntosDeDanio((vinculo.puntosDeDanio() - 10).max(0))
		}
		else {
			self.error("Debe vincular con un campeón para atacar")
		}
	}
	
	override method comprar(item){
		if (self.estaVinculado()){
			super(item)
		}
		else {
			self.error("Debe vincular con un campeón para comprar")
		}
	}
	override method vender(item){
		if (self.estaVinculado()){
			super(item)
		}
		else {
			self.error("Debe vincular con un campeón para vender")
		}
	}
}
