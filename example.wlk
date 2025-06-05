class Hogar {
  var nivelMugre 
  const confort

  method esBuena(){
    return nivelMugre  <= confort / 2
  }

  method efectoDelAtaque(unaPlaga){
    nivelMugre = nivelMugre + unaPlaga.daño()
  }
}

class Huerta{
  var produccion

  method esBuena(){
    return produccion > nivelMinimo.valor()
  }
  method efectoDelAtaque(unaPlaga){
    var extra = 0
     if(unaPlaga.transmiteEnfermedades()){
      extra = 10
     }
    produccion = (produccion - (unaPlaga.daño() * 0.1 + extra)).max(0)
  }
}

object nivelMinimo {
  var property valor = 0  
}

class Mascota{
  var salud
  
  method esBuena(){
    return salud > 250
  }

  method efectoDelAtaque(unaPlaga){
    if(unaPlaga.transmiteEnfermedades()){
      salud = (salud - unaPlaga.daño()).max(0)
    }

  }
}

class Barrio{
  const property elementos = []

  method esBueno(unElemento){
    var salida = false

    if(elementos.contains(unElemento)){
       salida = unElemento.esBuena()
    }

    return salida
    
  }
  method esCopado(){
    return self.cantElementosBuenos() > self.cantElementosMalos()
  }
  method cantElementosBuenos(){
    return elementos.count({e => e.esBuena()})
  }
  method cantElementosMalos(){
    return elementos.size() - self.cantElementosBuenos()
  }
}

class Plaga{
  var poblacion
  method transmiteEnfermedades(){
    return poblacion >= 10
  }
  method ataque() {
    poblacion = poblacion + (poblacion*0.1)    
  }
  method atacar(unElemento){
    unElemento.efectoDelAtaque(self)
    self.ataque()
  }
}

class Cucarachas inherits Plaga {
    var pesoPromedio      
    
    method daño(){
      return poblacion / 2
    }

    override method transmiteEnfermedades(){
      return super() and pesoPromedio >= 10
    }

    override method ataque(){
      super()
      pesoPromedio = pesoPromedio + 2
    }
}

class Pulgas inherits Plaga {  
    method daño() {
      return poblacion * 2
    }       
}

class Garrapatas inherits Pulgas {   
    override method ataque(){
      poblacion = poblacion + (poblacion*0.2)
    }
}

class Mosquitos inherits Plaga {
    method daño(){
      return poblacion
    }

    override method transmiteEnfermedades(){
      return poblacion % 3 == 0 and super()
    }    
}

