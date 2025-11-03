(deffacts smartphones-facts
(smartphones (nombre Samsung GalaxyA22) (marca Samsung) (smartphone-id 1900) (modelo GalaxyA22) (color Azul) (precio 8000))
(smartphones (nombre Samsung Note25) (marca Samsung) (smartphone-id 1901) (modelo Note25) (color Negro) (precio 25000))
(smartphones (nombre iPhone17ProMax) (marca Apple) (smartphone-id 1902) (modelo iPhone17ProMax) (color Naranja) (precio 50000))
(smartphones (nombre PocoX6Pro) (marca Xiaomi) (smartphone-id 1903) (modelo PocoX6Pro) (color Purpura) (precio 5000))
(smartphones (nombre Samsung GalaxyA25) (marca Samsung) (smartphone-id 1904) (modelo GalaxyA25) (color Azul) (precio 8500))
(smartphones (nombre HonorX6B) (marca Honor) (smartphone-id 1905) (modelo X6B) (color Blanco) (precio 2500))
)


(deffacts computadoras-facts
(computadoras (nombre HpVictus16) (marca HP) (computadora-id 1500) (modelo Victus16) (color Negro) (precio 21000))
(computadoras (nombre LenovoLOQ4060) (marca Lenovo) (computadora-id 1501) (modelo LOQ4060) (color Gris) (precio 25400))
(computadoras (nombre MSIThin15) (marca MSI) (computadora-id 1502) (modelo Thin15) (color RojoNegro) (precio 13100))
(computadoras (nombre AsusTUFGaming16) (marca Asus) (computadora-id 1503) (modelo TUFGaming16) (color Negro) (precio 15800))
(computadoras (nombre LenovoThinkpadT14) (marca Lenovo) (computadora-id 1504) (modelo ThinkpadT14) (color RojoNegro) (precio 6700))
)


(deffacts clientes-facts
(cliente (nombre CarlosVallarta) (cliente-id 1111) (direccion PuertoVallarta) (telefono 3313541697))
(cliente (nombre RodrigoZamora) (cliente-id 1112) (direccion Miravalle) (telefono 3313018634))
(cliente (nombre JaimePelayo) (cliente-id 1113) (direccion Ayutla) (telefono 3317963541))
(cliente (nombre AugustoGuerrero) (cliente-id 1114) (direccion Guadalajara) (telefono 3317930584))
(cliente (nombre AndresGonzales) (cliente-id 1115) (direccion ArcosDeZapopan) (telefono 3379820146))
(cliente (nombre AntonioArroyo) (cliente-id 1116) (direccion Tlajomulco) (telefono 3301785204))
)


(deffacts accesorios-facts
(accesorios (nombre TecladoMecanico) (accesorio-id 1230) (categoria Periferico) (marca Razer) (precio 800))
(accesorios (nombre Mouse) (accesorio-id 1231) (categoria Periferico) (marca Logitec) (precio 355))
(accesorios (nombre SillaDeOficina) (accesorio-id 1232) (categoria Mueble) (marca Corsair) (precio 3100))
(accesorios (nombre SSD1TB) (accesorio-id 1233) (categoria Componente) (marca Kingston) (precio 950))
(accesorios (nombre MemoriaRam8Gb) (accesorio-id 1234) (categoria Componente) (marca ADATA) (precio 389))
(accesorios (nombre Monitor1080) (accesorio-id 1235) (categoria Periferico) (marca Samsung) (precio 3700))
(accesorios (nombre Funda) (accesorio-id 1236) (categoria Proteccion) (marca Generico) (precio 100))
(accesorios (nombre MicaDeCristal) (accesorio-id 1237) (categoria Proteccion) (marca Generico) (precio 140))
)


(deffacts tarjetas-facts
(tarjetas (banco BBVA) (grupo VISA) (tarjeta-id 1001) (tipo Debito) (fechaexp 10/28))
(tarjetas (banco BBVA) (grupo VISA) (tarjeta-id 1002) (tipo Credito) (fechaexp 09/35))
(tarjetas (banco Santander) (grupo VISA) (tarjeta-id 1003) (tipo Debito) (fechaexp 01/26))
(tarjetas (banco NU) (grupo Mastercard) (tarjeta-id 1004) (tipo Credito) (fechaexp 05/31))
(tarjetas (banco Citibanamex) (grupo Mastercard) (tarjeta-id 1005) (tipo Debito) (fechaexp 08/29))
(tarjetas (banco Citibanamex) (grupo VISA) (tarjeta-id 1006) (tipo Credito) (fechaexp 11/30))
)


(deffacts vales-facts
(vales (vale-id v001) (des "Vale de $100 por cada $1000 de compra"))
(vales (vale-id v002) (des "Cupón del 10% por ser cliente nuevo"))
(vales (vale-id v003) (des "Vale de $200 por cliente frecuente"))
(vales (vale-id v004) (des "Vale del 5% por pago en efectivo"))
(vales (vale-id v005) (des "Doble vale de $200 por promoción especial"))
)


(deffacts ordenes-facts
(orden (orden-id 9001) (cliente-id 1111))
(orden (orden-id 9002) (cliente-id 1112))
(orden (orden-id 9003) (cliente-id 1113))
)


(deffacts line-items-facts
(line-item (orden-id 9001) (cliente-id 1111) (smartphone-id 1902) (tarjeta-id 1006) (quantity 2))
(line-item (orden-id 9002) (cliente-id 1112) (computadora-id 1503) (tarjeta-id 1003) (quantity 1))
(line-item (orden-id 9003) (cliente-id 1113) (smartphone-id 1901) (accesorio-id 1236) (tarjeta-id 1001) (quantity 12))
)
