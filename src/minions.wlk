class Minions{
	var property cantidadDeMinions
	var property plusDeAtaque
	
	method estoyVivo() = cantidadDeMinions>0
	
	method defenderse(){
		return if(self.estoyVivo()) cantidadDeMinions + plusDeAtaque else 0
	}
	method recibirAtaque(danio){
		cantidadDeMinions = (cantidadDeMinions - danio).max(0)
	}
}