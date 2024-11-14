select getdate() as FechaHora_actual

SELECT CAST('2024-11-13' AS DATE) AS FechaConvertida;
SELECT CAST('2024-11-13' AS DATETIME) AS FechaHoraConvertida;


/*DATEDIFF

La funci�n DATEDIFF calcula la diferencia entre dos fechas y devuelve el resultado en una unidad de tiempo espec�fica (como d�as, meses, a�os, horas, minutos, etc.).
Sintaxis:

DATEDIFF(unidad, fecha_inicial, fecha_final)

    unidad: Especifica la unidad de tiempo en la que deseas medir la diferencia. Algunas de las unidades m�s comunes son:
        year o yy (a�os)
        quarter o qq (trimestres)
        month o mm (meses)
        day o dd (d�as)
        hour o hh (horas)
        minute o mi (minutos)
        second o ss (segundos)
        millisecond (milisegundos)

    fecha_inicial: La primera fecha de la comparaci�n.

    fecha_final: La segunda fecha de la comparaci�n.

*/

SELECT DATEDIFF(day, '2024-01-01', getDate()) AS DiferenciaEnDias;


/*
DATEADD

La funci�n DATEADD se utiliza para sumar o restar un intervalo de tiempo a una fecha dada.
Sintaxis:

DATEADD(unidad, cantidad, fecha)

    unidad: Especifica la unidad de tiempo en la que se sumar� o restar� la cantidad. Puede ser lo mismo que en DATEDIFF (por ejemplo, year, month, day, etc.).
    cantidad: La cantidad que deseas sumar o restar (puede ser un n�mero positivo o negativo).
    fecha: La fecha a la que se le sumar� o restar� la cantidad.
*/

-- Sumando dias:

SELECT DATEADD(day, 10, '2024-11-01') AS NuevaFecha;

-- Restando meses:

SELECT DATEADD(month, -2, '2024-11-13') AS FechaRestada;

