class Hogar {
  const nivelMugre 
  const confort

  method esBuena(){
    return nivelMugre  <= confort / 2
  }
}

class Huerta{
  const produccion

  method esBuena(){
    return produccion > nivelMinimo.valor()
  }
}

object nivelMinimo {
  var property valor = 0  
}

class Mascota{
  const salud
  
  method esBuena(){
    return salud > 250
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
  const poblacion
  method transmiteEnfermedades(){
    return poblacion >= 10
  } 
}

class Cucarachas inherits Plaga {
    const pesoPromedio      
    
    method daño(){
      return poblacion / 2
    }

    override method transmiteEnfermedades(){
      return super() and pesoPromedio >= 10
    }
}

class Pulgas inherits Plaga {  
    method daño() {
      return poblacion * 2
    }       
}

class Garrapatas inherits Pulgas {   
    
}

class Mosquitos inherits Plaga {
    method daño(){
      return poblacion
    }

    override method transmiteEnfermedades(){
      return poblacion % 3 == 0 and super()
    }    
}