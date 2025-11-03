(deftemplate smartphones
	(slot smartphone-id)
	(multislot nombre)
	(slot marca)
	(multislot modelo)
	(slot color)
	(slot precio)
)

(deftemplate computadoras
	(slot computadora-id)
	(multislot nombre)
	(slot marca)
	(multislot modelo)
	(slot color)
	(slot precio)
)
	
(deftemplate cliente
	(slot cliente-id)
	(multislot nombre)
	(multislot direccion)
	(slot telefono)
)

(deftemplate accesorios
	(slot accesorio-id)
	(multislot nombre)
	(slot categoria)
	(slot marca) 
	(slot precio)
)

(deftemplate orden
	(slot orden-id)
	(slot cliente-id)
)

(deftemplate tarjetas
	(slot tarjeta-id)
	(slot banco)
	(slot grupo)
	(slot tipo)
	(slot fechaexp)
)

(deftemplate vales
	(slot vale-id)
	(multislot des)
)

(deftemplate line-item
  (slot smartphone-id)
  (slot computadora-id)
  (slot cliente-id)
  (slot accesorio-id)
  (slot orden-id)
  (slot tarjeta-id)
  (slot vale-id)
  (slot quantity (default 1))
 )



























