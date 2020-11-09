object inmobiliaria{
	const empleados = #{}
	method mejorEmpleado(criterio)= criterio.obtenerElMejor(empleados)
}

object comisionesPorOperacionesCerradas{
	method obtenerElMejor(empleados)= empleados.max({empleado => empleado.comisiones()})
}
class empleado{
	var comisiones
	var reservas
	var concretadas
	method comisiones()= comisiones
	method concretarOperacion(cliente, operacion){
		if(operacion.EstaReservada() && operacion.clienteQueReservo() != cliente)
		{self.error("No se puede concretar la operacion porque está reservada por otro cliente")}
		concretadas.add(operacion)
		comisiones += operacion.comision()
	}
	
	method reservarOperacion(cliente, operacion){
		reservas.add(operacion)
		operacion.nuevaReserva(cliente)
		
	}
}

class Operacion{
	const empleado
	var valorInmueble
	var clienteQueReservo
	//La operacion no tiene que conocer esto, busco en la lista de reservas de los empleados y veo si alguno la tiene
	var estado /*reservada o concretada */
	method clienteQueReservo()= clienteQueReservo
	method nuevaReserva(cliente){clienteQueReservo = cliente}
}

class Alquiler inherits Operacion{
	var mesesContrato
	method comision()= (mesesContrato * valorInmueble) / 50
}

class Venta inherits Operacion{
	var porcentaje
	method comision()= (porcentaje* valorInmueble) / 100
}

class Inmueble{
	const tamanio
	const cantidadAmbientes
	const modoPublicacion 
	var zona
	method tamanio()= tamanio
	method precioBase()
	method precioFinal()= self.precioBase() + zona.plus()
}

class Casa inherits Inmueble{
	var precio
	override method precioBase()= precio
	
}

class Ph inherits Inmueble{
	override method precioBase()= (14000* tamanio).min(500000)
}

class Departamento inherits Inmueble{
	override method precioBase()= 350000 * cantidadAmbientes
}















//Con objetos

object casa{
	var precio //todas las casas tendrían el mismo precio
	method precioBase(inmueble)= precio
}

object ph{
	method precioBase(inmueble)= (14000* inmueble.tamanio()).min(500000)
}

object departamento {
	 method precioBase(inmueble)= 350000 * inmueble.cantidadAmbientes()
}








