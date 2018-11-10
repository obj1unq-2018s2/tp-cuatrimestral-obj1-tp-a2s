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
		var property oleadasDeMinions = []// una lista de oleadas de Minions
		var property cantidadDeMinions =return  oleadasDeMinions.sum{oleada => oleada.cantidadDeMinions()}
		 method estoyVivo(){
			return  oleadasDeMinions.all{oleada => oleada.estoyVivo()}
	}
	
		 method recibirAtaque(danio){
			oleadasDeMinions.forEach{oleada => oleada.recibirAtaque(danio)}
		}
		
		 method defenderse(){
		 	var defensaTotal = 0
			oleadasDeMinions.forEach{oleada => defensaTotal = defensaTotal + oleada.defenderse()}
			return defensaTotal
			}


				
}