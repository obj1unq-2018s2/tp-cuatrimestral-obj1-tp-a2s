class AnilloDeDoran {

	const property precio = 300

	method habilidadActivable(campeon_) {
	}

	method serEquipado(campeon_) {
		campeon_.recibirDMG(5)
	}

	method serDesequipado(campeon_) {
		campeon_.recibirDMG(-10)
	}

	method amplificarVida(campeon_) {
		return 60
	}

	method amplificarAtaque(campeon_) {
		return 15
	}

}

class TomoAmplificador {
	var usoUnico = true
	method precio() = 500

	method habilidadActivable(campeon_) {
		// TODO No puede ser variable local
		//var usoUnico = true
		if (campeon_.dinero() < 500 and usoUnico) {
			campeon_.dinero(500)
			usoUnico = false
		}
	}

	method serEquipado(campeon_) {
		campeon_.recibirBloqueos(2)
	}

	method serDesequipado(campeon_) {
		campeon_.recibirBloqueos(1)
		campeon_.recibirDMG(30)
	}

	method amplificarVida(campeon_) {
		return campeon_.puntosDeDanio() * 0.25
	}

	method amplificarAtaque(campeon_) {
		return campeon_.puntosDeDanio() * 0.05
	}

}

class SombreroDeRabadon inherits TomoAmplificador {

	override method precio() = 100 + super()

	override method serEquipado(campeon_) {
		campeon_.recibirBloqueos(2)
		campeon_.recibirDMG(5)
	}

	override method amplificarVida(campeon_) {
		return super(campeon_) + 5
	}

	override method amplificarAtaque(campeon_) {
		return campeon_.puntosDeDanio() * 2
	}

	override method serDesequipado(campeon_) {
	}

}

class PocionDeVida {
	var usos = 2
	method precio() = 50

	method serEquipado(campeon_) {
	}

	method serDesequipado(campeon_) {
	}

	method habilidadActivable(campeon_) {
		// TODO No puede ser variable local.
		//var usos = 2
		if (usos > 0) {
			campeon_.recibirDMG(-50)
			usos -= 1
		}
	}

	method amplificarVida(campeon_) {
		return 0
	}

	method amplificarAtaque(campeon_) {
		return 0
	}

}

class BastonDelVacio {

	// PARTE INDIVIDUAL DE: Tobias Ambrosi
	var property materiales = []

	method precio() = 0

	method serEquipado(camepon_) {
	}

	method serDesequipado(campeon_) {
	}

	method habilidadActivable(campeon_) {
		materiales.forEach{ item => item.habilidadActivable(campeon_)}
	}

	method amplificarVida(campeon_) = materiales.sum{ item => item.amplificarVida() / 2 }

	method amplificarAtaque(camepon_) = materiales.sum{ item => item.amplificarAtaque() }

}

