-- 0. SETEO DE DB
USE EJERCICIO_2
GO
/*
Proveedor (NroProv, NomProv, Categoria, CiudadProv)
Art�culo  (NroArt, Descripci�n, CiudadArt, Precio)
Cliente   (NroCli, NomCli, CiudadCli)
Pedido    (NroPed, NroArt, NroCli, NroProv, FechaPedido, Cantidad, PrecioTotal)
Stock     (NroArt, fecha, cantidad)
*/
--0. Liste todos los proveedores

--0.1. Liste los proveedores de la ciudad San Justo

--0.2. Liste los proveedores de Laferrere y de categoria 'cat2'

--0.3. Liste los proveedores de San Justo o de categoria 'cat4'

--1.	Hallar el c�digo (nroProv) de los proveedores que proveen el art�culo a146.
	
--2.	Hallar los clientes (nomCli) que solicitan art�culos provistos por p015.

--3.	Hallar los clientes que solicitan alg�n item provisto por proveedores 
--      con categor�a mayor que 4.

--4.	Hallar los pedidos en los que un cliente de Rosario solicita art�culos 
--      producidos en la ciudad de Mendoza.

--5.	Hallar los pedidos en los que el cliente c23 solicita art�culos solicitados 
--      por el cliente c30.


--6.0  Hallar los proveedores que suministran todos los art�culos
--ayuda:
--1ro contar articulos
--2do contar cuantos art provee cada prov.
-- usar ambas queries


--6.1 Hallar los proveedores que suministran todos los art�culos cuyo precio es superior 
--      al precio promedio de todos los art.

-- QUE CAMBIA RESPECTO DE LA QUERY 6.0? QUE EL TODOS, AHORA ES UN CONJUNTO MENOR

--6.2	Hallar los proveedores que suministran todos los art�culos cuyo precio es superior 
--      al precio promedio de los art�culos que se producen en La Plata.

-- AYUDA: 1ro art precio superior al promedio y producios en la plata
-- luego hago el cociente

--7.	Hallar la cantidad de art�culos diferentes provistos por cada proveedor que provee a todos los clientes de Jun�n.

--7.1 Hallar la cantidad de art�culos diferentes provistos por cada proveedor que provee a todos los clientes de Jun�n.

--8.	Hallar los nombres de los proveedores cuya categor�a sea mayor que la de todos los 
--      proveedores que proveen el art�culo cuaderno.


--AYUDA:
-- LISTAR PROV CON LA CATEGORIA MAYOR
-- LISTAR PROVEE DE ART CUADERNO
-- LISTAR categoria de los prov de cuadernos
-- BUSCAR max categoria de los prov de cuadernos


-- 8.1 Hallar los nombres de los proveedores cuya categor�a sea mayor que la de todos los proveedores que proveen el art�culo cuaderno.

--9.	Hallar los proveedores que han provisto m�s de 1000 unidades entre los art�culos 1 y 100 .

	 
--10.	Listar la cantidad y el precio total de cada art�culo que han pedido los Clientes 
--a sus proveedores entre las fechas 01-01-2004 y 31-03-2004
-- (se requiere visualizar Cliente, Articulo, Proveedor, Cantidad y Precio).


--11.	Idem anterior y que adem�s la Cantidad sea mayor o igual a 1000 o el Precio sea mayor a $1000


--12.	Listar la descripci�n de los art�culos en donde se hayan pedido en el d�a m�s del 
--      stock existente para ese mismo d�a.

--13.	Listar los datos de los proveedores que hayan pedido de todos los art�culos en un mismo d�a. 
--      Verificar s�lo en el �ltimo mes de pedidos.

--13.1 Listar los datos de los proveedores que hayan pedido de todos los art�culos

--13.2 Listar los datos de los proveedores que hayan pedido de todos los art�culos en un mismo d�a.


--14.	Listar los proveedores a los cuales no se les haya solicitado ning�n art�culo en el �ltimo mes, 
--      pero s� se les haya pedido en el mismo mes del a�o anterior.

/*
Proveedor (NroProv, NomProv, Categoria, CiudadProv)
Art�culo  (NroArt, Descripci�n, CiudadArt, Precio)
Cliente   (NroCli, NomCli, CiudadCli)
Pedido    (NroPed, NroArt, NroCli, NroProv, FechaPedido, Cantidad, PrecioTotal)
Stock     (NroArt, fecha, cantidad)
*/


-- TRABAJO CON FECHAS
SELECT GETDATE() [FECHA HOY], DATEADD(MONTH, -1, GETDATE()) [ UN MES PARA ATRAS], YEAR(GETDATE()) [A�o], MONTH(GETDATE()) [MES], DAY(GETDATE()) [DIA]
-- FECHAS DEL A�O PASADO
SELECT DATEADD(YEAR ,-1, DATEADD(MONTH, -1, GETDATE())) ,  DATEADD(YEAR, -1, GETDATE())
--datediff -- muestra diferencia entre dos fechas
--dateadd -- agregar o substrae respecto de una fecha. puedo agregarle a una fecha dada, X segundos o Y minutos, o Z dias, etc 
--getdate -- | now  retorna la fecha de hoy

-- prov que tuvieron pedidos durante el ultimo mes
-- prov que NO tuvieron pedidos durante el ultimo mes


-- prov que SI tuvieron pedidos durante el ultimo mes, pero del a�o anterior

--Listar los proveedores a los cuales no se les haya solicitado ning�n art�culo en el �ltimo mes, pero s� se les haya pedido en el mismo mes del a�o anterior.

--15.	Listar los nombres de los clientes que hayan solicitado m�s de un art�culo cuyo precio sea superior a $100
--y que correspondan a proveedores de Capital Federal. Por ejemplo, se considerar� si se ha solicitado el art�culo a2 y a3, 
--pero no si solicitaron 5 unidades del articulo a2.
 