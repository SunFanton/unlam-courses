/*

La cl�usula NOT EXISTS se usa en SQL para verificar si no existe al menos una fila que cumpla con una condici�n dentro de una subconsulta. Si no se encuentra ninguna fila que cumpla con la condici�n, entonces la consulta principal devuelve la fila (o las filas) correspondientes.

Resumen:
NOT EXISTS devuelve TRUE si no existe ning�n registro que cumpla la condici�n de la subconsulta.
Si existe al menos una fila que cumpla la condici�n de la subconsulta, entonces NOT EXISTS devuelve FALSE y no selecciona esa fila en la consulta principal.

La cl�usula EXISTS es lo contrario de NOT EXISTS. Mientras que NOT EXISTS verifica si no existe ninguna fila que cumpla con una condici�n en una subconsulta, EXISTS se utiliza para verificar si existe al menos una fila que cumpla con una condici�n.

Resumen de EXISTS:
EXISTS devuelve TRUE si existe al menos una fila que cumpla con la condici�n de la subconsulta.
EXISTS devuelve FALSE si no existe ninguna fila que cumpla con la condici�n.

Ejemplo:
Imaginemos que tenemos una tabla de Empleados y otra de Proyectos, y queremos ver los empleados que no est�n asignados a ning�n proyecto.

SELECT e.id_empleado, e.nombre
FROM Empleados e
WHERE NOT EXISTS (
    SELECT 1
    FROM Proyectos p
    WHERE p.id_empleado = e.id_empleado
);

es como preguntarse: este empleado NO EXISTE en el resultado de esta subconsulta?
si eso me da true (no existe), entonces ese empleado me lo devuelve el select

Por el contrario, si queremos saber qu� empleados est�n asignados a un proyecto:

SELECT e.id_empleado, e.nombre
FROM Empleados e
WHERE EXISTS (
    SELECT 1
    FROM Proyectos p
    WHERE p.id_empleado = e.id_empleado
);


*/


--Usar el SQL para hallar las personas que:

--1. Frecuentan solamente bares que sirven alguna cerveza que les guste.

SELECT p.id, p.nombre, p.apellido
FROM Persona p
WHERE NOT EXISTS (
    -- Subconsulta para comprobar si frecuentan bares que no sirven cervezas que les gustan
    SELECT 1
    FROM Frecuenta f
    JOIN Sirve s ON f.barId = s.barId
    JOIN Gusta g ON s.cervezaId = g.cervezaId AND g.personaId = p.id
    WHERE f.personaId = p.id
    AND NOT EXISTS (-- Bares que no sirven cervezas que les gustan
        SELECT 1
        FROM Sirve s2
        WHERE s2.barId = f.barId
        AND s2.cervezaId IN (SELECT cervezaId FROM Gusta WHERE personaId = p.id)
    )
);

/*
1. SELECT p.id, p.nombre, p.apellido
Primero, estamos seleccionando los campos id, nombre y apellido de la tabla Persona. Estos son los datos que queremos obtener para cada persona que cumpla con la condici�n que definimos en el WHERE.

2. FROM Persona p
Aqu� estamos diciendo que vamos a trabajar con la tabla Persona y asignamos un alias p para referirnos a ella de manera m�s corta dentro de la consulta.

3. WHERE NOT EXISTS (...)
La condici�n WHERE NOT EXISTS nos permite excluir a las personas que no cumplen con la l�gica dentro de la subconsulta.

�Qu� hace NOT EXISTS?

NOT EXISTS devuelve TRUE si no existe ning�n resultado en la subconsulta interna. Si dentro de la subconsulta encontramos alg�n registro que cumpla con las condiciones, la persona ser� excluida del resultado.
En este caso, lo que estamos buscando es que no haya bares que frecuentan que no sirven cervezas que les gustan. Si encontramos una persona que s� frecuenta un bar que no sirve cervezas que le gustan, la consulta la excluir�.

4. Subconsulta Interna (la que est� dentro de NOT EXISTS)
La subconsulta interna est� dise�ada para encontrar casos donde una persona frecuenta un bar que no sirve cervezas que le gustan. Si encontramos cualquier caso de este tipo, la persona ser� excluida. Vamos a desglosarla:

SELECT 1
FROM Frecuenta f
JOIN Sirve s ON f.barId = s.barId
JOIN Gusta g ON s.cervezaId = g.cervezaId AND g.personaId = p.id
WHERE f.personaId = p.id
AND NOT EXISTS (
    SELECT 1
    FROM Sirve s2
    WHERE s2.barId = f.barId
    AND s2.cervezaId IN (SELECT cervezaId FROM Gusta WHERE personaId = p.id)
)
4.1 FROM Frecuenta f
Empezamos la subconsulta desde la tabla Frecuenta, que asocia a las personas con los bares que frecuentan. Usamos el alias f para referirnos a la tabla.

4.2 JOIN Sirve s ON f.barId = s.barId
Hacemos un JOIN con la tabla Sirve (que contiene la relaci�n entre los bares y las cervezas que sirven) para obtener la informaci�n de las cervezas que cada bar ofrece. La condici�n de la uni�n es que barId coincida entre las tablas Frecuenta y Sirve.

4.3 JOIN Gusta g ON s.cervezaId = g.cervezaId AND g.personaId = p.id
Luego, unimos la tabla Gusta, que relaciona a las personas con las cervezas que les gustan, con la condici�n de que la cervezaId de la tabla Sirve coincida con la cervezaId de la tabla Gusta y que la personaId de la tabla Gusta coincida con el id de la persona que estamos evaluando (p.id).

Esto asegura que estamos verificando solo las cervezas que les gustan a la persona en cuesti�n.

4.4 WHERE f.personaId = p.id
Esto filtra la tabla Frecuenta para obtener solo los bares que frecuenta la persona que estamos evaluando.

4.5 AND NOT EXISTS (...)
Dentro de esta subconsulta hay otra subconsulta anidada. Esta es la parte clave. Lo que buscamos es verificar si el bar no sirve alguna de las cervezas que le gustan a la persona.

4.6 Subconsulta Anidada (Verificaci�n de cervezas que sirven en el bar)

SELECT 1
FROM Sirve s2
WHERE s2.barId = f.barId
AND s2.cervezaId IN (SELECT cervezaId FROM Gusta WHERE personaId = p.id)

Esta subconsulta verifica si el bar que estamos evaluando (f.barId) sirve alguna de las cervezas que le gustan a la persona (p.id). 
Si el bar no sirve ninguna de las cervezas que le gustan a la persona, la subconsulta devuelve alg�n resultado, lo que hace que la persona sea excluida del resultado final de la consulta principal.

5. Resumen del comportamiento de la consulta
Lo que buscamos: Queremos encontrar a las personas que solo frecuentan bares que sirven cervezas que les gustan.
C�mo lo logramos:
Verificamos para cada persona si existe alg�n bar que frecuentan y que no sirva alguna de las cervezas que les gustan. Si encontramos este tipo de bar, la persona es excluida.
Si no existe tal bar (es decir, si solo frecuentan bares que sirven cervezas que les gustan), la persona se incluye en los resultados.
Ejemplo pr�ctico
Supongamos que tenemos los siguientes datos:

Juan gusta de las cervezas Rubia e IPA.
Bar La Bodega sirve Rubia e IPA.
Bar del Centro sirve IPA, Stout, y Lager.
La consulta verificar� si Juan frecuenta alg�n bar que sirva cervezas que no le gustan. Si frecuenta un bar como el Bar del Centro (que sirve Stout y Lager, que no le gustan), entonces Juan ser�a excluido de los resultados. Si solo frecuenta bares como Bar La Bodega (que sirve cervezas que le gustan), entonces Juan ser�a incluido en los resultados.

Conclusi�n
La consulta utiliza una combinaci�n de NOT EXISTS y subconsultas para asegurarse de que una persona solo sea seleccionada si todos los bares que frecuenta sirven cervezas que les gustan. Si cualquier bar no sirve alguna de las cervezas que le gustan a la persona, esa persona ser� excluida.

*/

--2. No frecuentan ning�n bar que sirva alguna cerveza que les guste.

SELECT p.id, p.nombre, p.apellido
FROM Persona p
WHERE NOT EXISTS (
    -- Subconsulta para comprobar si frecuentan bares que sirven cervezas que les gustan
    SELECT 1
    FROM Frecuenta f
    JOIN Sirve s ON f.barId = s.barId
    JOIN Gusta g ON s.cervezaId = g.cervezaId AND g.personaId = p.id
    WHERE f.personaId = p.id
);


--3. Frecuentan solamente los bares que sirven todas las cervezas que les gustan.
SELECT p.id, p.nombre, p.apellido
FROM Persona p
WHERE NOT EXISTS (
    -- Subconsulta para encontrar bares que no sirven todas las cervezas que les gustan
    SELECT 1
    FROM Frecuenta f
    JOIN Sirve s ON f.barId = s.barId
    WHERE f.personaId = p.id
    AND NOT EXISTS (
        -- Subconsulta para verificar que cada cerveza que les gusta est� en el bar
        SELECT 1
        FROM Gusta g
        WHERE g.personaId = p.id
        AND NOT EXISTS (
            SELECT 1
            FROM Sirve s2
            WHERE s2.barId = f.barId
            AND s2.cervezaId = g.cervezaId
        )
    )
);


--4. Frecuentan solamente los bares que no sirven ninguna de las cervezas que no les gusta.
SELECT p.id, p.nombre, p.apellido
FROM Persona p
WHERE NOT EXISTS (
    -- Subconsulta para encontrar bares que sirven cervezas que no les gustan
    SELECT 1
    FROM Frecuenta f
    JOIN Sirve s ON f.barId = s.barId
    WHERE f.personaId = p.id
    AND EXISTS (
        SELECT 1
        FROM Gusta g
        WHERE g.personaId = p.id
        AND g.cervezaId != s.cervezaId
    )
);
