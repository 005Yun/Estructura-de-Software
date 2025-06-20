-- Establece el Lunes como el primer d�a de la semana para consistencia en los c�lculos.
SET DATEFIRST 1;

-- Se utiliza una Expresi�n de Tabla Com�n (CTE) recursiva para generar todas las fechas del a�o.
-- Este es el m�todo est�ndar y m�s eficiente en SQL Server.
WITH DateGenerator AS (
    -- 1. Caso Base: La fecha de inicio
    SELECT CAST('2025-01-01' AS DATE) AS DateValue
    UNION ALL
    -- 2. Paso Recursivo: A�ade un d�a a la fecha anterior hasta llegar al final del a�o
    SELECT DATEADD(day, 1, DateValue)
    FROM DateGenerator
    WHERE DateValue < '2025-12-31'
)
-- 3. Inserta los resultados en la tabla Dim_Fecha calculando cada columna
INSERT INTO Dim_Fecha (
    ID_Fecha_CS, 
    Fecha_Completa, 
    Anio, 
    Mes, 
    Trimestre, 
    Nombre_Mes, 
    Semana_Anio, 
    Dia_Anio, 
    Dia_Semana_Numero, 
    Nombre_Dia_Semana, 
    Es_Fin_De_Semana
)
SELECT
    FORMAT(DateValue, 'yyyyMMdd') AS ID_Fecha_CS, -- Formato AAAAMMDD
    DateValue AS Fecha_Completa,
    YEAR(DateValue) AS Anio,
    MONTH(DateValue) AS Mes,
    DATEPART(quarter, DateValue) AS Trimestre,
    FORMAT(DateValue, 'MMMM', 'es-es') AS Nombre_Mes, -- Obtiene el nombre del mes en espa�ol
    DATEPART(week, DateValue) AS Semana_Anio,
    DATEPART(dayofyear, DateValue) AS Dia_Anio,
    DATEPART(weekday, DateValue) AS Dia_Semana_Numero, -- Con DATEFIRST 1: 1=Lunes, 7=Domingo
    FORMAT(DateValue, 'dddd', 'es-es') AS Nombre_Dia_Semana, -- Obtiene el nombre del d�a en espa�ol
    CASE 
        WHEN DATEPART(weekday, DateValue) IN (6, 7) THEN 1 -- S�bado (6) o Domingo (7)
        ELSE 0 
    END AS Es_Fin_De_Semana
FROM DateGenerator
OPTION (MAXRECURSION 366); -- Permite que la recursi�n se ejecute para todos los d�as del a�o.

select * from Dim_Fecha