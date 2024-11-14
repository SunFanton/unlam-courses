USE EJ7;
GO

--  1. Indique cuales son los autos con mayor cantidad de kil�metros 
--     realizados en el �ltimo mes.

-- HINTS! PUEDEN USAR LA FUNCION DATEDIFF

-- RESULTADO ESPERADO (CON LOS DATOS DADOS): COCHE AAA123, KM 86
--==============================================================================================

--  2. Indique los clientes que m�s viajes hayan realizado con el mismo chofer.


-- RESULTADO ESPERADO (CON LOS DATOS DADOS): CLIENTE 1, CHOFER 1, VIAJES 7
--==============================================================================================

--  3. Indique el o los clientes con mayor cantidad de viajes en este a�o.


-- RESULTADO ESPERADO (CON LOS DATOS DADOS): CLIENTE 1
--==============================================================================================


--  4. Obtenga nombre y apellido de los choferes que no manejaron todos 
--     los veh�culos que disponemos.


-- RESULTADO ESPERADO (CON LOS DATOS DADOS): NROLICENCIA 2, 3, 4
--==============================================================================================

--  5. Obtenga el nombre y apellido de los clientes que hayan viajado en 
--     todos nuestros autos.-- RESULTADO ESPERADO (CON LOS DATOS DADOS): NOMBRE DIEGO, APELLIDO BORATTO
--==============================================================================================
-- 6. Queremos conocer el tiempo de espera promedio de los viajes de los 
--    �ltimos 2 meses

-- RESULTADO ESPERADO (CON LOS DATOS DADOS): [PROM ESPERA TOTAL] 1
--==============================================================================================

-- 7. Indique los kil�metros realizados en viajes por cada auto.


-- RESULTADO ESPERADO (CON LOS DATOS DADOS): 
/*
COCHE   KM DEL AUTO
AA888BB	12
AAA123	86
AAA321	12
AS777AB	114
BBB123	12
CCC132	12
*/
--==============================================================================================

-- 8. Indique el costo promedio de los viajes realizados por cada auto.


-- RESULTADO ESPERADO (CON LOS DATOS DADOS): 
/*
COCHE   COSTO PROMEDIO
AA888BB	12000.00
AAA123	29000.00
AAA321	12000.00
AS777AB	29250.00
BBB123	12000.00
CCC132	12000.00
*/
--==============================================================================================

-- 9. Indique el costo total de los viajes realizados por cada chofer en el 
--    �ltimo mes.


-- RESULTADO ESPERADO (CON LOS DATOS DADOS): 
/*
CHOFER COSTO PROMEDI
1	147000.00
2	70000.00
*/
--==============================================================================================

-- 10. Indique la fecha inicial, el chofer y el cliente que hayan realizado 
--     el viaje m�s largo de este a�o.-- RESULTADO ESPERADO (CON LOS DATOS DADOS): 
/*
fechaHoraInicio	    Chofer	cliente
2024-11-08 18:30:00	1	    1
*/
--==============================================================================================
