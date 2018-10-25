class AnilloDeDoran{
	method serEquipado(campeon_){
		campeon_.recibirHP(60)
		campeon_.recibirATK(15)
		campeon_.recibirDMG(5)
	}
	method serDesequipado(campeon_){campeon_.recibirDMG(-10)}
}
class TomoAmplificador{
	method serEquipado(campeon_){
		campeon_.recibirHP(campeon_.puntosDeDanio() * 0.25)
		campeon_.recibirATK(campeon_.puntosDeDanio() * 0.05)
		campeon_.recibirBloqueos(2)
	}
	method serDesequipado(campeon_){
		campeon_.recibirBloqueos(1)
		campeon_.recibirDMG(30)
	}
}
class SombreroDeRabadon{
	method serEquipado(campeon_){
		campeon_.recibirHP((campeon_.puntosDeDanio() * 0.25) + 5)
		campeon_.recibirATK(campeon_.puntosDeAtaque() * 2)
		campeon_.recibirBloqueos(2)
		campeon_.recibirDMG(5)
	}
	method serDesequipado(campeon_){} //no pasa nada
}