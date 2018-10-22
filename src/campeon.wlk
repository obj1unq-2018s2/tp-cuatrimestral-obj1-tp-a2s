//import items.*
//import minions.*
class Campeon{
	var property puntosDeVida 
	var property puntosDeAtaque
	var property bloqueos
	var property puntosDeDanio = 0
	var itemsEquipados = []
	
	method equipar(item){
		itemsEquipados.add(item)
	}
	method desequipar(item){
		itemsEquipados.remove(item)
	}
	method atacar(){
		
	}
}