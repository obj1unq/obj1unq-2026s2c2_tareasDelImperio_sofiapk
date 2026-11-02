class Tarea{

    method recursosProducidos(tiempo) {
        return 50 * (tiempo - self.desgaste(tiempo) * self.esfuerzo() )
    }
    
    method desgaste(tiempo) // abstracto

    method esfuerzo() // abstracto
}

class Siembra inherits Tarea {
    const jornadaNormal = 8 // magic number
    const desgastePorHoraExtra = 1 // magic number

    var estaciónDelAño = temporadaDeLluvia

    method estaciónDelAño() = estaciónDelAño

    method horasExtra(horasDedicadas) {
        return (horasDedicadas - jornadaNormal).max(1)
    }

    override method desgaste(horasDedicadas){
        return desgastePorHoraExtra * self.horasExtra(horasDedicadas)
    }

    

}

class SiembraEnElValle inherits Siembra {

}

class SiembraEnTerrazas { // montaña

}

object temporadaDeLluvia {
  
}

object temporadaDeSequía {
  
}

class Mensaje {

}

class MensajeImperial inherits Mensaje {

}