(defrule visa-apple
   (line-item (orden-id ?oid) (cliente-id ?cid) (smartphone-id ?sid) (tarjeta-id ?tid))
   (cliente (cliente-id ?cid) (nombre $?nombre))
   (smartphones (smartphone-id ?sid) (marca apple) (nombre $?pname))
   (tarjetas (tarjeta-id ?tid) (banco ?banco) (grupo ?grupo))
   =>
   (printout t crlf
      "[ORDEN: " ?oid "] Cliente: " $?nombre " (ID: " ?cid ")" crlf
      "Producto: " $?pname " — Tarjeta: " ?banco " " ?grupo crlf
      ">> 8% de descuento pagando con VISA en productos Apple." crlf
      "-------------------------------------------------------------" crlf))

(defrule promo-bbva-visa
   (line-item (orden-id ?oid) (cliente-id ?cid) (smartphone-id ?sid) (tarjeta-id ?tid))
   (cliente (cliente-id ?cid) (nombre $?nombre))
   (smartphones (smartphone-id ?sid) (nombre $?pname))
   (tarjetas (tarjeta-id ?tid) (banco bbva) (grupo visa))
   =>
   (printout t crlf
      "[ORDEN: " ?oid "] Cliente: " $?nombre " (ID: " ?cid ")" crlf
      "Producto: " $?pname " — Tarjeta: BBVA VISA" crlf
      ">> Promoción: 5% de cashback pagando con BBVA VISA." crlf
      "-------------------------------------------------------------" crlf))

(defrule combo-macbook-iphone
   (line-item (orden-id ?oid) (cliente-id ?cid) (smartphone-id ?sid) (computadora-id ?cid2))
   (cliente (cliente-id ?cid) (nombre $?nombre))
   (smartphones (smartphone-id ?sid) (modelo iPhone16) (nombre $?pname))
   (computadoras (computadora-id ?cid2) (modelo MacBookAir) (nombre $?cname))
   =>
   (assert (vales (vale-id v001) (des "Vale de $100 por cada $1000 de compra")))
   (printout t crlf
      "[ORDEN: " ?oid "] Cliente: " $?nombre " (ID: " ?cid ")" crlf
      "Productos: " $?pname ", " $?cname crlf
      ">> Generado: vale de $100 por cada $1000 de compra." crlf
      "-------------------------------------------------------------" crlf))

(defrule descuento-accesorios-smartphone
   (line-item (orden-id ?oid) (cliente-id ?cid) (smartphone-id ?sid))
   (cliente (cliente-id ?cid) (nombre $?nombre))
   (smartphones (smartphone-id ?sid) (nombre $?pname))
   =>
   (printout t crlf
      "[ORDEN: " ?oid "] Cliente: " $?nombre " (ID: " ?cid ")" crlf
      "Producto: " $?pname crlf
      ">> Descuento del 15% en funda y mica por comprar smartphone." crlf
      "-------------------------------------------------------------" crlf))

(defrule promo-mastercard
   (line-item (orden-id ?oid) (cliente-id ?cid) (tarjeta-id ?tid))
   (cliente (cliente-id ?cid) (nombre $?nombre))
   (tarjetas (tarjeta-id ?tid) (grupo mastercard) (banco ?banco))
   =>
   (printout t crlf
      "[ORDEN: " ?oid "] Cliente: " $?nombre " (ID: " ?cid ")" crlf
      "Tarjeta: " ?banco " MasterCard" crlf
      ">> Descuento del 5% pagando con MasterCard." crlf
      "-------------------------------------------------------------" crlf))

(defrule promo-note21-liverpool
   (line-item (orden-id ?oid) (cliente-id ?cid) (smartphone-id ?sid) (tarjeta-id ?tid))
   (cliente (cliente-id ?cid) (nombre $?nombre))
   (smartphones (smartphone-id ?sid) (marca samsung) (modelo Note21) (nombre $?pname))
   (tarjetas (tarjeta-id ?tid) (banco liverpool) (grupo visa))
   =>
   (printout t crlf
      "[ORDEN: " ?oid "] Cliente: " $?nombre " (ID: " ?cid ")" crlf
      "Producto: " $?pname " — Tarjeta: Liverpool VISA" crlf
      ">> Oferta: 12 meses sin intereses con Liverpool VISA al comprar Note21." crlf
      "-------------------------------------------------------------" crlf))

(defrule promo-macbookpro-santander
   (line-item (orden-id ?oid) (cliente-id ?cid) (computadora-id ?cid2) (tarjeta-id ?tid))
   (cliente (cliente-id ?cid) (nombre $?nombre))
   (computadoras (computadora-id ?cid2) (modelo MacBookPro) (nombre $?cname))
   (tarjetas (tarjeta-id ?tid) (banco santander))
   =>
   (printout t crlf
      "[ORDEN: " ?oid "] Cliente: " $?nombre " (ID: " ?cid ")" crlf
      "Producto: " $?cname " — Tarjeta: Santander" crlf
      ">> Oferta: 18 meses sin intereses con Santander." crlf
      "-------------------------------------------------------------" crlf))

(defrule combo-accesorio-smartphone
   (line-item (orden-id ?oid) (cliente-id ?cid) (smartphone-id ?sid) (accesorio-id ?aid))
   (cliente (cliente-id ?cid) (nombre $?nombre))
   (smartphones (smartphone-id ?sid) (nombre $?pname))
   (accesorios (accesorio-id ?aid) (nombre $?aname))
   =>
   (printout t crlf
      "[ORDEN: " ?oid "] Cliente: " $?nombre " (ID: " ?cid ")" crlf
      "Productos: " $?pname " + " $?aname crlf
      ">> Combo: 20% de descuento en funda al comprar smartphone." crlf
      "-------------------------------------------------------------" crlf))

(defrule vale-efectivo
   (line-item (orden-id ?oid) (cliente-id ?cid))
   (cliente (cliente-id ?cid) (nombre $?nombre))
   =>
   (assert (vales (vale-id v004) (des "Vale del 5% por pago en efectivo")))
   (printout t crlf
      "[ORDEN: " ?oid "] Cliente: " $?nombre " (ID: " ?cid ")" crlf
      ">> Vale generado: 5% de devolución por pago en efectivo." crlf
      "-------------------------------------------------------------" crlf))

(defrule descuento-accesorios
   (line-item (orden-id ?oid) (cliente-id ?cid) (accesorio-id ?aid))
   (cliente (cliente-id ?cid) (nombre $?nombre))
   (accesorios (accesorio-id ?aid) (precio ?p&:(> ?p 2000)) (nombre $?aname))
   =>
   (printout t crlf
      "[ORDEN: " ?oid "] Cliente: " $?nombre " (ID: " ?cid ")" crlf
      "Accesorio: " $?aname " (Precio: $" ?p ")" crlf
      ">> Descuento del 10% en accesorios mayores a $2000." crlf
      "-------------------------------------------------------------" crlf))