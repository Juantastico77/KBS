(deftemplate estado
    (slot posicionMono)
    (slot nivelMono)
    (slot posicionCaja)
    (slot tienePlatano)
)

(deftemplate visitado
    (slot posicionMono)
    (slot nivelMono)
    (slot posicionCaja)
    (slot tienePlatano)
)

(deffacts metas
    (meta-actual ir-a-caja) ; Meta inicial: ir a la caja
)

(deffacts posiciones
    (posicion puerta)
    (posicion ventana)
    (posicion centro)
)

;; ESTADO INICIAL: Mono en ventana, Caja en puerta (Según la imagen)
(deffacts estado-inicial
    (estado (posicionMono ventana)
            (nivelMono suelo)
            (posicionCaja puerta) 
            (tienePlatano no))
)

;; Reglas

;; Registrar cada nuevo estado como visitado
(defrule recordar-estado
    ?s <- (estado (posicionMono ?P)
                  (nivelMono ?N)
                  (posicionCaja ?C)
                  (tienePlatano ?T))
    (not (visitado (posicionMono ?P)
                   (nivelMono ?N)
                   (posicionCaja ?C)
                   (tienePlatano ?T)))
    =>
    (assert (visitado (posicionMono ?P)
                      (nivelMono ?N)
                      (posicionCaja ?C)
                      (tienePlatano ?T)))
)

;; 1. Caminar hacia la caja (que está en la puerta)
(defrule caminar-a-caja
    (declare (salience 50))
    ?s <- (estado (posicionMono ?M)
                  (nivelMono suelo)
                  (posicionCaja ?C)
                  (tienePlatano no))
    ?meta <- (meta-actual ir-a-caja) ; <--- CORRECCIÓN APLICADA
    (test (neq ?M ?C))
    =>
    (retract ?s)
    (retract ?meta) ; <--- CORRECCIÓN APLICADA
    (assert (estado (posicionMono ?C)
                    (nivelMono suelo)
                    (posicionCaja ?C)
                    (tienePlatano no)))
    (assert (meta-actual empujar))
    (printout t "Acción: **caminar** de " ?M " a la caja en " ?C crlf)
)

;; 2. Agarrar la caja
(defrule agarrar-caja
    (declare (salience 40))
    ?s <- (estado (posicionMono ?P)
                  (nivelMono suelo)
                  (posicionCaja ?P)
                  (tienePlatano no))
    (meta-actual empujar) 
    (test (neq ?P centro))
    (not (visitado (posicionMono ?P) (nivelMono suelo) (posicionCaja ?P) (tienePlatano no)))
    =>
    (printout t "Acción: **agarrar** la caja en " ?P crlf)
)


;; 3. Empujar la caja hacia el plátano (centro)
(defrule empujar-caja
    (declare (salience 30))
    ?s <- (estado (posicionMono ?P)
                  (nivelMono suelo)
                  (posicionCaja ?P)
                  (tienePlatano no))
    ?meta <- (meta-actual empujar) ; <--- CORRECCIÓN APLICADA
    (test (neq ?P centro))
    =>
    (retract ?s)
    (retract ?meta) ; <--- CORRECCIÓN APLICADA
    (assert (estado (posicionMono centro)
                    (nivelMono suelo)
                    (posicionCaja centro)
                    (tienePlatano no)))
    (assert (meta-actual trepar))
    (printout t "Acción: **empujar** caja de " ?P " a centro" crlf)
)

;; 4. Soltar la caja
(defrule soltar-caja
    (declare (salience 25))
    (estado (posicionMono centro)
            (nivelMono suelo)
            (posicionCaja centro)
            (tienePlatano no))
    (meta-actual trepar)
    (not (visitado (posicionMono centro) (nivelMono encima) (posicionCaja centro) (tienePlatano no)))
    =>
    (printout t "Acción: **soltar** la caja en centro (para trepar)" crlf)
)

;; 5. Trepar a la caja
(defrule subirse-a-caja
    (declare (salience 20))
    ?s <- (estado (posicionMono centro)
                  (nivelMono suelo)
                  (posicionCaja centro)
                  (tienePlatano no))
    ?meta <- (meta-actual trepar) ; <--- CORRECCIÓN APLICADA
    (not (visitado (posicionMono centro)
                   (nivelMono encima)
                   (posicionCaja centro)
                   (tienePlatano no)))
    =>
    (retract ?s)
    (retract ?meta) ; <--- CORRECCIÓN APLICADA
    (assert (estado (posicionMono centro)
                    (nivelMono encima)
                    (posicionCaja centro)
                    (tienePlatano no)))
    (assert (meta-actual agarrar-platano))
    (printout t "Acción: **trepar** a la caja en centro" crlf)
)

;; 6. Agarrar la banana
(defrule agarrar-platano
    (declare (salience 40))
    ?s <- (estado (posicionMono centro)
                  (nivelMono encima)
                  (posicionCaja centro)
                  (tienePlatano no))
    ?meta <- (meta-actual agarrar-platano) ; <--- CORRECCIÓN APLICADA
    =>
    (retract ?s)
    (retract ?meta) ; <--- CORRECCIÓN APLICADA
    (assert (estado (posicionMono centro)
                    (nivelMono encima)
                    (posicionCaja centro)
                    (tienePlatano si)))
    (printout t "Acción: **agarrar** plátano" crlf)
    (printout t "*** Meta alcanzada: el mono tiene el plátano! ***" crlf)
)

;; DETENER – detener ejecución
(defrule terminado
    (declare (salience 100))
    (estado (tienePlatano si))
    =>
    (printout t "Terminando, meta alcanzada." crlf)
    (halt)
)