object reg {
	const registro = [] 
	
	method agregarAbatidosDia(cantidad,dia){
		if(self.yaEstaElDia(dia)){
		 	self.error("Ya existe el dia")
		    }
		registro.add([cantidad,dia])
	}
	method agregarAbatidosVariosDias(registrosAbatidos){
		registrosAbatidos.forEach{e => self.agregarAbatidosDia(e)}
		registro.addAll(registrosAbatidos)
	}
	method dia(reg) = reg.get(1)
	
	method cant(reg) = reg.first()
	
	method yaEstaElDia(dia) = registro.any({r => self.dia(r) == dia})
	
	method registroDia(dia) = registro.find({r => self.dia(r) == dia})
	
	method cantidadDeDiasRegistrados() = registro.size()
	
	method estaVacioElRegistro() = registro.isEmpty()
	
	method algunDiaAbatio(cantidad) = registro.any({r => self.cant(r) == cantidad})
	
	method primerValorDeAbatidos() = self.cant(registro.first())
	
	method ultimoValorDeAbatidos() = self.cant(registro.last())
	
	method ultimoValorDeAbatidosConSize() = self.cant(registro.get(registro.size(-1)))
	
	method maximoValorDeAbatidos() = registro.max({r => self. cant(r)}).first()
	
	method maximoValorConMap() = registro.map({r => self.cant(r)}).max()
	
	method totalAbatidos() = registro.sum({r => self.cant(r)})
	
	method totalDeAbatidosConMap() = registro.map({r => self.cant(r)}).sum()
	
	method cantidadDeAbatidosElDia(dia) = self.cant(self.registroDia(dia))
	
	method diasConAbatidosSuperioresA(cuanto) = self.dia(registro.map({r => self.cant(r) > cuanto}))
	
	//method valoresDeAbatidosPares() = 
	
	method esCrack() = (1..registro.size()-1).all{i => self.cant(registro.get(i)) > self.cant(registro.get(i-1))}
	
	
	method eliminarElRegistroDelDia(dia){
		if(not self.yaEstaElDia(dia)){
			self.error("El dia no esta en la lista")
		}
		registro.remove(self.registroDia(dia))
	}
	method eliminarVariosRegistrosDeDias(listaDeDias){
		if(listaDeDias.all{e => !self.yaEstaElDia(e)}){
			self.error("Algun dia de la lista no esta incluido en el registro")
		}
		listaDeDias.forEach{e => self.eliminarElRegistroDelDia(e)}
	}
}