(defrule promo-cantidad-apple
   (orden (marcas-en-orden $?m&:(member$ Apple $?m))
          (modelos-en-orden $?mod&:(member$ iPhone16 $?mod))
          (quantity ?q&:(> ?q 10))
          (tipo-cliente menudista))
   =>
   (printout t " Menudista Apple: 10% de descuento por más de 10 unidades." crlf))

(defrule promo-cantidad-apple-mayorista
   (orden (marcas-en-orden $?m&:(member$ Apple $?m))
          (modelos-en-orden $?mod&:(member$ iPhone16 $?mod))
          (quantity ?q&:(> ?q 10))
          (tipo-cliente mayorista))
   =>
   (printout t " Mayorista Apple: 15% de descuento por más de 10 unidades." crlf))

(defrule promo-samsung-nuevo
   (orden (marcas-en-orden $?m&:(member$ Samsung $?m))
          (tipo-cliente nuevo))
   =>
   (printout t " Nuevo cliente Samsung: 5% de descuento." crlf))

(defrule promo-xiaomi-estudiante
   (orden (marcas-en-orden $?m&:(member$ Xiaomi $?m))
          (tipo-cliente estudiante))
   =>
   (printout t " Xiaomi estudiantes: 12% de descuento con credencial." crlf))

(defrule promo-general-smartphone
   (orden (tipos-en-orden $?t&:(member$ smartphone $?t)))
   =>
   (printout t " Oferta general: 15% de descuento en funda y mica." crlf))


(defrule promo-banamex-iphone16
   (orden (banco-tarjeta banamex)
          (modelos-en-orden $?mod&:(member$ iPhone16 $?mod)))
   =>
   (printout t " Banamex + iPhone16: 3 meses sin intereses." crlf))

(defrule promo-liverpool
   (orden (grupo-tarjeta liverpool)
          (marcas-en-orden $?m&:(member$ Samsung $?m)))
   =>
   (printout t " Liverpool + Samsung: 10% de descuento en pago total." crlf))

(defrule promo-bbva-general
   (orden (banco-tarjeta bbva))
   =>
   (printout t " BBVA: Envío gratuito en todas tus compras." crlf))

(defrule combo-macbookair-iphone16
   (orden (marcas-en-orden $?m&:(member$ Apple $?m))
          (modelos-en-orden $?mod))
   (test (and (member$ MacBookAir $?mod) (member$ iPhone16 $?mod)))
   =>
   (printout t "Combo Apple: MacBook Air + iPhone16 — Descuento del 10% en accesorios." crlf)
)

(defrule combo-iphone16-airpods
   (orden (marcas-en-orden $?m&:(member$ Apple $?m))
          (modelos-en-orden $?mod))
   (test (and (member$ iPhone16 $?mod) (member$ AirPods $?mod)))
   =>
   (printout t "Combo Apple: iPhone16 + AirPods — 15% de descuento en total." crlf)
)

(defrule combo-samsung-tv-smartphone
   (orden (marcas-en-orden $?m&:(member$ Samsung $?m))
          (tipos-en-orden $?tipos))
   (test (and (member$ tv $?tipos) (member$ smartphone $?tipos)))
   =>
   (printout t "Combo Samsung: TV + Smartphone — Envío gratis + 10% de descuento." crlf)
)


(defrule recomendacion-apple
   (orden (marcas-en-orden $?m&:(member$ Apple $?m)))
   =>
   (printout t " Recomendación: añade funda o AppleCare." crlf))

(defrule recomendacion-samsung
   (orden (marcas-en-orden $?m&:(member$ Samsung $?m)))
   =>
   (printout t " Recomendación: añade Galaxy Buds o funda protectora." crlf))

(defrule recomendacion-xiaomi
   (orden (marcas-en-orden $?m&:(member$ Xiaomi $?m)))
   =>
   (printout t " Recomendación: añade powerbank o audífonos Redmi." crlf))


(defrule alerta-stock-bajo
   (inventario (marca ?marca) (modelo ?modelo) (stock ?s&:(< ?s 10)))
   =>
   (printout t " Stock bajo de " ?marca " " ?modelo " (" ?s " unidades)." crlf))

(defrule cliente-frecuente
   (orden (tipo-cliente frecuente))
   =>
   (printout t "Cliente frecuente: 10% de descuento adicional." crlf))



(defrule actualizar-stock
   ?inv <- (inventario (marca ?marca) (modelo ?modelo) (stock ?s))
   ?ord <- (orden (marcas-en-orden $?m&:(member$ ?marca $?m))
                  (modelos-en-orden $?mod&:(member$ ?modelo $?mod))
                  (quantity ?q))
   =>
   (bind ?nuevo (- ?s ?q))
   (if (>= ?nuevo 0)
       then (modify ?inv (stock ?nuevo))
            (printout t " Stock actualizado: " ?marca " " ?modelo
                      " → " ?s " a " ?nuevo crlf)
       else (printout t " Error: stock insuficiente para " ?modelo crlf)))