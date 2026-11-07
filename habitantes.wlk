class Habitante {
    var property energía

    method índiceDeResistencia() // abstracto

    method tiempo() // abstracto

    method realizarTarea(tarea) {
        self.validarRealizarTarea(tarea)
        self.perderEnergíaEnTarea(tarea)
    }
    
    method validarRealizarTarea(tarea) {
        if ( not self.puedeRealizarTarea(tarea) ) {
            self.error("La tarea " + tarea + " no puede ser realizada")
        }
    }

    method puedeRealizarTarea(tarea) {
        return energía > self.energíaPerdida(tarea)
    }

    method perderEnergíaEnTarea(tarea) {
        energía -= self.energíaPerdida(tarea)
    }

    method energíaPerdida(tarea) {
        return tarea.recursosProducidos( self.tiempo() ) / self.índiceDeResistencia()
    }
}

class Campesine inherits Habitante {
    var tiempoQueDedica

    override method índiceDeResistencia() = 10

    override method tiempo() = tiempoQueDedica

    method tiempo(_tiempo) { tiempoQueDedica = _tiempo }
}

class Elite inherits Habitante {
    const cantidadDadaDeRecursos = 500 // magic number

    override method índiceDeResistencia() = 12

    override method tiempo() = 10

    override method perderEnergíaEnTarea(tarea) {
        super(tarea)
        energía += 5
    }

    override method puedeRealizarTarea(tarea) {
        return super(tarea) && self.condiciónAdicional(tarea)
    }

    method condiciónAdicional(tarea) {
        return tarea.recursosProducidos( self.tiempo() ) > cantidadDadaDeRecursos
    }
}