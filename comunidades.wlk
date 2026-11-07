class Ayllu {
    var property colcas = #{}

    method mejorColcaParaHabitante(habitante) {
        return colcas.max( { colca => colca.recursosTotalesProducidosPorHabitante(habitante) } )
    }

    method colcasSuavesParaHabitante(habitante){
        return colcas.filter( { colca => colca.esColcaSuaveParaHabitante(habitante) } )
    }
    
    method tareasMásExigentesParaHabitante(habitante) {
        return colcas.map( { colca => colca.tareaMásExigenteParaHabitante(habitante) } ).asSet()
    }
}

class Colca {
    var property tareas = #{}

    method recursosTotalesProducidosPorHabitante(habitante) {
        return tareas.sum( { tarea => tarea.recursosProducidos( habitante.tiempo() ) } )
    }

    method esColcaSuaveParaHabitante(habitante) {
        return tareas.any( { tarea => tarea.recursosProducidos( habitante.tiempo() ) < 200 } )
    }

    method tareaMásExigenteParaHabitante(habitante) {
        return tareas.max( { tarea => tarea.recursosProducidos( habitante.tiempo() ) } )
    }
}