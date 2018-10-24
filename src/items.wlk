class AnilloDeDoran{
	method otorgarVida(campeon_){
		return 60
	}
	method otorgarAtaque(campeon_){
		return 15
	}
	method otorgarDanio(){
		return 5
	}
	method danioRecuperado(){
		return 10
	}
	method bloqueosAlEquipar() = 0
	method bloqueosAlDesequipar() = 0
}
class TomoAmplificador{
	method otorgarVida(campeon_){
		return 0.25 * campeon_.puntosDeDanio()
	}
	method otorgarAtaque(campeon_){
		return 0.05 * campeon_.puntosDeDanio()
	}
	method bloqueosAlEquipar() = 2
	method bloqueosAlDesequipar() = 1
	method otorgarDanio(){
		return 30
	}
	method danioRecuperado() = 0
}
class SombreroDeRabadon{
	method otorgarVida(campeon_){
		return (0.25 * campeon_.puntosDeDanio()) + 5
	}
	method otorgarAtaque(campeon_){
		return campeon_.puntosDeAtaque() * 2
	}
	method bloqueosAlEquipar() = 2
	method bloqueosAlDesequipar() = 0
	method otorgarDanio(){
		return 5 // no se si 5 o 35 porque decia "puntos extra"
	}
	method danioRecuperado() = 0
}