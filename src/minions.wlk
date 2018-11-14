class Minions {

	var property cantidadDeMinions
	var property plusDeAtaque

	method estoyVivo() = cantidadDeMinions > 0

	method defenderse() {
		return if (self.estoyVivo()) cantidadDeMinions + plusDeAtaque else 0
	}

	method recibirAtaque(danio) {
		cantidadDeMinions = (cantidadDeMinions - danio).max(0)
	}

}

class EjercitoDeMinions {

	var property oleadasDeMinions = [] // una lista de oleadas de Minions
	
	// TODO Usar un método
//	var property cantidadDeMinions = return oleadasDeMinions.sum{ oleada => oleada.cantidadDeMinions() }



	method cantidadDeMinions(){
		return oleadasDeMinions.sum{ oleada => oleada.cantidadDeMinions() }
	}
	

	method estoyVivo() {
		return oleadasDeMinions.any{ oleada => oleada.estoyVivo() }
	}

	method recibirAtaque(danio) {
		oleadasDeMinions.forEach{ oleada => oleada.recibirAtaque(danio)}
	}

	method defenderse() {
		// TODO No usar foreach para preguntas, ver manejo de colecciones.
			
		return oleadasDeMinions.sum{ oleada =>  oleada.defenderse()}

	}
	


}

