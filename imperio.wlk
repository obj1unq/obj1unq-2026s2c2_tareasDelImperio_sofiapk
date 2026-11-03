class Tarea{
    method recursosProducidos(tiempo) = 50 * (tiempo - self.desgaste(tiempo) * self.esfuerzo() )
    
    method desgaste(tiempo) // abstracto

    method esfuerzo() // abstracto
}

class Siembra inherits Tarea {
    var esfuerzo
    const desgastePorHoraExtra = 1 // magic number

    override method desgaste(tiempo) = desgastePorHoraExtra + self.horasExtra(tiempo)

    method horasExtra(tiempo) = ( tiempo - self.jornadaNormal() ).max(0)

    method jornadaNormal() // abstracto

    override method esfuerzo() = esfuerzo

    method esfuerzo(_esfuerzo) { esfuerzo = _esfuerzo }
}

class SiembraEnElValle inherits Siembra {
    var property epocaDelAño
    
    override method jornadaNormal() = 8

    override method recursosProducidos(tiempo) { 
        return if ( epocaDelAño.sePuedeSembrar() ) {
            super(tiempo) 
        }
    }
}

class SiembraEnTerrazas inherits Siembra { // montaña
    const triplicarRecursos = 3 // magic number

    override method jornadaNormal() = 6

    override method recursosProducidos(tiempo) = triplicarRecursos * super(tiempo)
}

object temporadaDeLluvia { // de diciembre a junio
    method puedeRealizarse() {
        return false
    }
}

object temporadaDeSequía {
    method puedeRealizarse() {
        return true
    }
}

class Mensaje {
    method esfuerzo() = 1.4

    method desgaste(tiempo) = tiempo / 4
}

class MensajeImperial inherits Mensaje { // mensajes urgentes
    override method esfuerzo() = 1.8

    override method desgaste(tiempo) = ( super(tiempo) - 2 ).max(1)
}