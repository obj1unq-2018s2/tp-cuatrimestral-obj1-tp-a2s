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
	
	
	class EjercitoDeMinions {
		var property oleadasDeMinions // una lista de oleadas de Minions
		
		 method estoyVivo(){
			return  oleadasDeMinions.all{oleadas => oleadas.estoyVivo()}
	}
	
		 method recibirAtaque(danio){
			oleadasDeMinions.forEach{oleadas => oleadas.recibirAtaque(danio)}
		}
		
		 method defenderse(){
		 	var defensaTotal = 0
			oleadasDeMinions.forEach{oleadas => defensaTotal = defensaTotal + oleadas.defenderse()
			return defensaTotal
			}
		}
}