USE Larabox;
GO

--Eje 11
SELECT Nombres ,Apellidos ,Email , Nacimiento,
CASE
WHEN (Month(Nacimiento) < Month(getdate())) OR 
(Month(Nacimiento) = Month(getdate()) AND Day(Nacimiento) < Day(getdate()))
THEN Year(getdate()) - Year(Nacimiento)
ELSE Year(getdate()) - Year(Nacimiento) -1
END AS Edad
FROM DatosPersonales;

--Eje 12
SELECT * FROM DatosPersonales WHERE Celular IS NULL;

--Eje 13
SELECT * FROM DatosPersonales WHERE Celular IS NOT NULL AND Telefono IS NULL;

--Eje 14
SELECT * FROM DatosPersonales WHERE Celular IS NOT NULL AND Domicilio IS NOT NULL;

--Eje 15
SELECT Apellidos, Nombres, Email, isnull(Celular,'Sin celular') AS Celular FROM DatosPersonales;

--Eje 16
SELECT Apellidos + ' ' + Nombres AS [Apellido y Nombre], Email,
CASE 
WHEN Celular IS NULL 
THEN isnull(Telefono,'Incontable')
ELSE Celular
END AS Comunicacion
FROM DatosPersonales;

--Eje 17
SELECT Apellidos, Nombres, YEAR(Nacimiento) AS [Año de Nacimiento] FROM DatosPersonales;

--Eje 18
SELECT Apellidos + ' ' + Nombres AS [Apellido Y Nombre], Nacimiento,
CASE
WHEN Year(Nacimiento) BETWEEN 1969 and 1980
THEN 'Generacion X'
WHEN Year(Nacimiento) BETWEEN 1981 and 1993
THEN 'Generacion Z'
WHEN Year(Nacimiento) BETWEEN 1994 and 2010
THEN 'Millennians'
ELSE 'fuera de rango'
END AS Generacion
FROM DatosPersonales;


--Eje 19
SELECT TOP 1 Nombres + ' ' + Apellidos AS [Nombre y Apellido], Nacimiento FROM DatosPersonales
ORDER BY(Nacimiento) DESC;

--Eje 20
SELECT DISTINCT YEAR(Nacimiento) AS [Año de Nacimiento] FROM DatosPersonales;

--Eje 21
SELECT Nombre,Extension,
DATEDIFF(DAY,Creacion,Modificacion) AS [Diferencia en dias]
 FROM Archivos;

--Eje 22
SELECT * FROM Usuarios AS u
INNER JOIN DatosPersonales AS d ON u.ID=d.ID
INNER JOIN Localidades AS l ON l.ID = d.IDLocalidad
WHERE L.ID NOT IN (1,3,5,7);

--Eje 23
SELECT * FROM Archivos
WHERE Estado IN (1) AND
Tamaño NOT BETWEEN 15 AND 75 AND
Extension NOT IN ('JPEG','AVI') AND
(YEAR(Creacion) = 1212 or YEAR(Creacion) = 2015);

--Eje 24
SELECT * FROM DatosPersonales AS d
INNER JOIN Usuarios AS u ON d.ID = u.ID
WHERE d.Domicilio LIKE('%Virrey%') OR d.Domicilio LIKE('%Doctora%');

--Eje 25
SELECT * FROM DatosPersonales
WHERE Email LIKE('%yahoo%') OR Email LIKE ('%hotmail%');

--Eje 26
SELECT * FROM DatosPersonales 
WHERE Nombres LIKE('[aeiou]%[aeiou]');