class AnilloDeDoran{
	method serEquipado(campeon_){
		campeon_.recibirHP(60)
		campeon_.recibirATK(15)
		campeon_.recibirDMG(5)
	}
	method serDesequipado(campeon_){
		campeon_.recibirDMG(-10)
		campeon_.recibirHP(-60)
		campeon_.recibirATK(-15)
	}
	method amplificarVida(campeon_){return 0}
	method amplificarAtaque(campeon_){return 0}
	//Agrego estos dos métodos sólo por razones de conservación polimórfica.
}
class TomoAmplificador{
	method serEquipado(campeon_){
		campeon_.recibirBloqueos(2)
	}
	method serDesequipado(campeon_){
		campeon_.recibirBloqueos(1)
		campeon_.recibirDMG(30)
	}
	method amplificarVida(campeon_){
		return campeon_.puntosDeDanio() * 0.25
 	}
	method amplificarAtaque(campeon_){
		return campeon_.puntosDeDanio() * 0.05
	}
}
class SombreroDeRabadon{
	method serEquipado(campeon_){
		campeon_.recibirBloqueos(2)
		campeon_.recibirDMG(5)
	}
	method amplificarVida(campeon_){
		return campeon_.puntosDeDanio() * 0.25 + 5
	}
	method amplificarAtaque(campeon_){
		return campeon_.puntosDeDanio() * 2
	}
	method serDesequipado(campeon_){} //no pasa nada
}