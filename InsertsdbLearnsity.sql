USE dbLearnsityMultidimensional;
GO

-- Deshabilitar temporalmente las restricciones de clave externa para facilitar la carga masiva en el orden deseado
-- (Opcional, pero puede ser �til si se ejecuta el script en partes o si hay dependencias complejas)
-- EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
-- GO

-- =======================================================================================================
-- INSERTS PARA DIMENSIONES
-- =======================================================================================================

-- -------------------------------------------------------------------------------------------------------
-- Dim_Fecha
-- (7 fechas espec�ficas por mes para Enero - Mayo 2024)
-- -------------------------------------------------------------------------------------------------------
INSERT INTO Dim_Fecha (ID_Fecha_CS, Fecha_Completa, Anio, Mes, Trimestre, Nombre_Mes, Semana_Anio, Dia_Anio, Dia_Semana_Numero, Nombre_Dia_Semana, Es_Fin_De_Semana) VALUES
-- Enero 2024
(20240101, '2024-01-01', 2024, 1, 1, 'Enero', 1, 1, 1, 'Lunes', 0),
(20240105, '2024-01-05', 2024, 1, 1, 'Enero', 1, 5, 5, 'Viernes', 0),
(20240110, '2024-01-10', 2024, 1, 1, 'Enero', 2, 10, 3, 'Mi�rcoles', 0),
(20240115, '2024-01-15', 2024, 1, 1, 'Enero', 3, 15, 1, 'Lunes', 0),
(20240120, '2024-01-20', 2024, 1, 1, 'Enero', 3, 20, 6, 'S�bado', 1),
(20240125, '2024-01-25', 2024, 1, 1, 'Enero', 4, 25, 4, 'Jueves', 0),
(20240130, '2024-01-30', 2024, 1, 1, 'Enero', 5, 30, 2, 'Martes', 0),
-- Febrero 2024
(20240201, '2024-02-01', 2024, 2, 1, 'Febrero', 5, 32, 4, 'Jueves', 0),
(20240205, '2024-02-05', 2024, 2, 1, 'Febrero', 6, 36, 1, 'Lunes', 0),
(20240210, '2024-02-10', 2024, 2, 1, 'Febrero', 6, 41, 6, 'S�bado', 1),
(20240215, '2024-02-15', 2024, 2, 1, 'Febrero', 7, 46, 4, 'Jueves', 0),
(20240220, '2024-02-20', 2024, 2, 1, 'Febrero', 8, 51, 2, 'Martes', 0),
(20240225, '2024-02-25', 2024, 2, 1, 'Febrero', 8, 56, 7, 'Domingo', 1),
(20240228, '2024-02-28', 2024, 2, 1, 'Febrero', 9, 59, 3, 'Mi�rcoles', 0),
-- Marzo 2024
(20240301, '2024-03-01', 2024, 3, 1, 'Marzo', 9, 61, 5, 'Viernes', 0),
(20240305, '2024-03-05', 2024, 3, 1, 'Marzo', 10, 65, 2, 'Martes', 0),
(20240310, '2024-03-10', 2024, 3, 1, 'Marzo', 10, 70, 7, 'Domingo', 1),
(20240315, '2024-03-15', 2024, 3, 1, 'Marzo', 11, 75, 5, 'Viernes', 0),
(20240320, '2024-03-20', 2024, 3, 1, 'Marzo', 12, 80, 3, 'Mi�rcoles', 0),
(20240325, '2024-03-25', 2024, 3, 1, 'Marzo', 13, 85, 1, 'Lunes', 0),
(20240330, '2024-03-30', 2024, 3, 1, 'Marzo', 13, 90, 6, 'S�bado', 1),
-- Abril 2024
(20240401, '2024-04-01', 2024, 4, 2, 'Abril', 14, 92, 1, 'Lunes', 0),
(20240405, '2024-04-05', 2024, 4, 2, 'Abril', 14, 96, 5, 'Viernes', 0),
(20240410, '2024-04-10', 2024, 4, 2, 'Abril', 15, 101, 3, 'Mi�rcoles', 0),
(20240415, '2024-04-15', 2024, 4, 2, 'Abril', 16, 106, 1, 'Lunes', 0),
(20240420, '2024-04-20', 2024, 4, 2, 'Abril', 16, 111, 6, 'S�bado', 1),
(20240425, '2024-04-25', 2024, 4, 2, 'Abril', 17, 116, 4, 'Jueves', 0),
(20240430, '2024-04-30', 2024, 4, 2, 'Abril', 18, 121, 2, 'Martes', 0),
-- Mayo 2024
(20240501, '2024-05-01', 2024, 5, 2, 'Mayo', 18, 122, 3, 'Mi�rcoles', 0),
(20240505, '2024-05-05', 2024, 5, 2, 'Mayo', 18, 126, 7, 'Domingo', 1),
(20240510, '2024-05-10', 2024, 5, 2, 'Mayo', 19, 131, 5, 'Viernes', 0),
(20240515, '2024-05-15', 2024, 5, 2, 'Mayo', 20, 136, 3, 'Mi�rcoles', 0),
(20240520, '2024-05-20', 2024, 5, 2, 'Mayo', 21, 141, 1, 'Lunes', 0),
(20240525, '2024-05-25', 2024, 5, 2, 'Mayo', 21, 146, 6, 'S�bado', 1),
(20240530, '2024-05-30', 2024, 5, 2, 'Mayo', 22, 151, 4, 'Jueves', 0);

-- -------------------------------------------------------------------------------------------------------
-- Dim_Usuario (ID_Usuario_CS es IDENTITY)
-- -------------------------------------------------------------------------------------------------------
INSERT INTO Dim_Usuario (ID_Usuario_CN, Nombre_Completo, Correo, Fecha_Nacimiento) VALUES
(101, 'Ana Sof�a Torres Vega', 'ana.torres@email.com', '1990-05-15'),
(102, 'Luis Carlos P�rez G�mez', 'luis.perez@email.com', '1985-11-20'),
(103, 'Mar�a Fernanda D�az L�pez', 'maria.diaz@email.com', '1992-07-01'),
(104, 'Jorge Andr�s Castillo Ruiz', 'jorge.castillo@email.com', '1988-03-10'),
(105, 'Laura Valentina Mora Silva', 'laura.mora@email.com', '1995-09-25'),
(106, 'Pedro Antonio Jim�nez Vargas', 'pedro.jimenez@email.com', '1980-01-30'),
(107, 'Sof�a Camila Herrera Castro', 'sofia.herrera@email.com', '1998-06-12'),
(108, 'Miguel �ngel Rojas Ortiz', 'miguel.rojas@email.com', '1991-12-05'),
(109, 'Valentina Isabel Flores Mendoza', 'valentina.flores@email.com', '1993-04-18'),
(110, 'Juan David S�nchez Paredes', 'juan.sanchez@email.com', '1987-08-22'),
(111, 'Gabriela Paz N��ez Soto', 'gabriela.nunez@email.com', '1996-02-28'),
(112, 'Andr�s Felipe R�os Bravo', 'andres.rios@email.com', '1989-10-14'),
(113, 'Camila Andrea Pinto Aguilera', 'camila.pinto@email.com', '1994-07-07'),
(114, 'Diego Alejandro Baeza Carrasco', 'diego.baeza@email.com', '1997-05-03'),
(115, 'Isabella Antonia Vidal Reyes', 'isabella.vidal@email.com', '1999-11-11');

-- -------------------------------------------------------------------------------------------------------
-- Dim_Categoria
-- -------------------------------------------------------------------------------------------------------
INSERT INTO Dim_Categoria (ID_Categoria_CS, ID_Categoria_CN, Nombre_Categoria) VALUES
(1, 10, 'Desarrollo Web'),
(2, 20, 'Ciencia de Datos'),
(3, 30, 'Marketing Digital'),
(4, 40, 'Dise�o Gr�fico'),
(5, 50, 'Idiomas');

-- -------------------------------------------------------------------------------------------------------
-- Dim_Curso
-- (ID_Curso_CN debe ser �nico si se usa como referencia en Dim_Temario con FK)
-- -------------------------------------------------------------------------------------------------------
INSERT INTO Dim_Curso (ID_Curso_CS, ID_Curso_CN, Nombre_Curso, Duracion_Horas, Nivel_Curso, ID_Categoria_CS) VALUES
(1, 1001, 'Introducci�n a HTML y CSS', 40, 'B�sico', 1),
(2, 1002, 'JavaScript para Principiantes', 60, 'B�sico', 1),
(3, 1003, 'Python para Ciencia de Datos', 80, 'Intermedio', 2),
(4, 1004, 'Fundamentos de SEO', 30, 'B�sico', 3),
(5, 1005, 'Dise�o de Logos con Illustrator', 50, 'Intermedio', 4),
(6, 1006, 'Ingl�s para Negocios', 100, 'Avanzado', 5),
(7, 1007, 'Desarrollo Backend con Node.js', 70, 'Intermedio', 1),
(8, 1008, 'Machine Learning Aplicado', 90, 'Avanzado', 2),
(9, 1009, 'Redes Sociales para Empresas', 35, 'B�sico', 3),
(10, 1010, 'Photoshop Esencial', 45, 'B�sico', 4);

-- -------------------------------------------------------------------------------------------------------
-- Dim_Instructor
-- -------------------------------------------------------------------------------------------------------
INSERT INTO Dim_Instructor (ID_Instructor_CS, ID_Instructor_CN, Nombre_Completo_Instructor, Especialidad, Biografia, URL_Imagen) VALUES
(1, 201, 'Carlos Santana L�pez', 'Desarrollo Full Stack', 'Experto en tecnolog�as web con m�s de 10 a�os de experiencia.', 'http://example.com/carlos.jpg'),
(2, 202, 'Elena Rivera Mesa', 'Cient�fica de Datos', 'PhD en Inteligencia Artificial, apasionada por el Big Data.', 'http://example.com/elena.jpg'),
(3, 203, 'Roberto Fern�ndez Gil', 'Marketing y SEO', 'Consultor de marketing digital para grandes marcas.', 'http://example.com/roberto.jpg'),
(4, 204, 'Luc�a M�ndez Parra', 'Dise�adora Gr�fica Senior', 'Creativa y especialista en identidad de marca.', 'http://example.com/lucia.jpg'),
(5, 205, 'David Osorio Kent', 'Profesor de Idiomas', 'Pol�glota con experiencia en ense�anza de ingl�s de negocios.', 'http://example.com/david.jpg');

-- -------------------------------------------------------------------------------------------------------
-- Dim_Temario
-- (ID_Curso_CN_Referencia se vincula a ID_Curso_CN de Dim_Curso)
-- -------------------------------------------------------------------------------------------------------
INSERT INTO Dim_Temario (ID_Temario_CS, ID_Temario_CN, ID_Curso_CN_Referencia, Titulo_Temario, Descripcion_Temario) VALUES
(1, 301, 1001, 'M�dulo 1: Fundamentos de HTML', 'Estructura b�sica, etiquetas principales.'),
(2, 302, 1001, 'M�dulo 2: Estilos con CSS', 'Selectores, propiedades, layout.'),
(3, 303, 1002, 'M�dulo 1: Variables y Tipos de Datos en JS', 'Introducci�n a la sintaxis de JavaScript.'),
(4, 304, 1002, 'M�dulo 2: Funciones y DOM', 'Manipulaci�n del Document Object Model.'),
(5, 305, 1003, 'Unidad 1: Introducci�n a Python', 'Sintaxis, estructuras de control.'),
(6, 306, 1003, 'Unidad 2: NumPy y Pandas', 'Librer�as esenciales para datos.'),
(7, 307, 1004, 'Tema 1: �Qu� es el SEO?', 'Conceptos clave y importancia.'),
(8, 308, 1004, 'Tema 2: Palabras Clave', 'Investigaci�n y selecci�n.'),
(9, 309, 1005, 'Lecci�n 1: Interfaz de Illustrator', 'Herramientas b�sicas para logos.'),
(10, 310, 1005, 'Lecci�n 2: Vectorizaci�n', 'Creaci�n de formas y trazados.'),
(11, 311, 1006, 'Parte 1: Vocabulario Financiero', 'T�rminos comunes en ingl�s.'),
(12, 312, 1006, 'Parte 2: Presentaciones Efectivas', 'Comunicaci�n en reuniones.'),
(13, 313, 1007, 'Secci�n 1: API REST con Express', 'Construcci�n de endpoints.'),
(14, 314, 1007, 'Secci�n 2: Bases de Datos NoSQL', 'Integraci�n con MongoDB.'),
(15, 315, 1008, 'Cap�tulo 1: Regresi�n Lineal', 'Modelos predictivos b�sicos.'),
(16, 316, 1008, 'Cap�tulo 2: �rboles de Decisi�n', 'Clasificaci�n y regresi�n.'),
(17, 317, 1009, 'M�dulo A: Facebook e Instagram Ads', 'Creaci�n de campa�as.'),
(18, 318, 1009, 'M�dulo B: M�tricas y KPIs', 'An�lisis de rendimiento.'),
(19, 319, 1010, 'Tema Principal 1: Capas y M�scaras', 'Edici�n no destructiva.'),
(20, 320, 1010, 'Tema Principal 2: Retoque Fotogr�fico', 'Mejora de im�genes.');

-- -------------------------------------------------------------------------------------------------------
-- Puente_Curso_Instructor
-- -------------------------------------------------------------------------------------------------------
INSERT INTO Puente_Curso_Instructor (ID_Curso_CS, ID_Instructor_CS) VALUES
(1, 1), (2, 1), (7, 1), -- Carlos Santana imparte cursos de Desarrollo Web
(3, 2), (8, 2),         -- Elena Rivera imparte cursos de Ciencia de Datos
(4, 3), (9, 3),         -- Roberto Fern�ndez imparte cursos de Marketing Digital
(5, 4), (10, 4),        -- Luc�a M�ndez imparte cursos de Dise�o Gr�fico
(6, 5);                 -- David Osorio imparte el curso de Idiomas

-- -------------------------------------------------------------------------------------------------------
-- Puente_Temario_Instructor
-- (Asignar instructores a temas espec�ficos)
-- -------------------------------------------------------------------------------------------------------
-- Temarios de Curso 1 (HTML/CSS) por Instructor 1
INSERT INTO Puente_Temario_Instructor (ID_Temario_CS, ID_Instructor_CS) VALUES (1, 1), (2, 1);
-- Temarios de Curso 2 (JavaScript) por Instructor 1
INSERT INTO Puente_Temario_Instructor (ID_Temario_CS, ID_Instructor_CS) VALUES (3, 1), (4, 1);
-- Temarios de Curso 3 (Python) por Instructor 2
INSERT INTO Puente_Temario_Instructor (ID_Temario_CS, ID_Instructor_CS) VALUES (5, 2), (6, 2);
-- Temarios de Curso 4 (SEO) por Instructor 3
INSERT INTO Puente_Temario_Instructor (ID_Temario_CS, ID_Instructor_CS) VALUES (7, 3), (8, 3);
-- Temarios de Curso 5 (Illustrator) por Instructor 4
INSERT INTO Puente_Temario_Instructor (ID_Temario_CS, ID_Instructor_CS) VALUES (9, 4), (10, 4);
-- Temarios de Curso 6 (Ingl�s) por Instructor 5
INSERT INTO Puente_Temario_Instructor (ID_Temario_CS, ID_Instructor_CS) VALUES (11, 5), (12, 5);
-- Temarios de Curso 7 (Node.js) por Instructor 1
INSERT INTO Puente_Temario_Instructor (ID_Temario_CS, ID_Instructor_CS) VALUES (13, 1), (14, 1);
-- Temarios de Curso 8 (Machine Learning) por Instructor 2
INSERT INTO Puente_Temario_Instructor (ID_Temario_CS, ID_Instructor_CS) VALUES (15, 2), (16, 2);
-- Temarios de Curso 9 (Redes Sociales) por Instructor 3
INSERT INTO Puente_Temario_Instructor (ID_Temario_CS, ID_Instructor_CS) VALUES (17, 3), (18, 3);
-- Temarios de Curso 10 (Photoshop) por Instructor 4
INSERT INTO Puente_Temario_Instructor (ID_Temario_CS, ID_Instructor_CS) VALUES (19, 4), (20, 4);


-- =======================================================================================================
-- INSERTS PARA TABLAS DE HECHOS
-- (7 registros por mes, Enero - Mayo)
-- ID_Usuario_CS va de 1 a 15 (asumiendo que IDENTITY genera estos IDs)
-- ID_Curso_CS va de 1 a 10
-- ID_Fecha_CS son los definidos en Dim_Fecha (YYYYMMDD)
-- =======================================================================================================

-- -------------------------------------------------------------------------------------------------------
-- Hecho_Registros_Usuario (ID_Registro_CS es IDENTITY)
-- -------------------------------------------------------------------------------------------------------
-- Enero (7 registros)
INSERT INTO Hecho_Registros_Usuario (ID_Usuario_CS, ID_Fecha_Registro_CS) VALUES
(1, 20240101), (2, 20240105), (3, 20240110), (4, 20240115), (5, 20240120), (6, 20240125), (7, 20240130);
-- Febrero (7 registros)
INSERT INTO Hecho_Registros_Usuario (ID_Usuario_CS, ID_Fecha_Registro_CS) VALUES
(8, 20240201), (9, 20240205), (10, 20240210), (11, 20240215), (12, 20240220), (13, 20240225), (14, 20240228);
-- Marzo (7 registros)
INSERT INTO Hecho_Registros_Usuario (ID_Usuario_CS, ID_Fecha_Registro_CS) VALUES
(15, 20240301), (1, 20240305), (2, 20240310), (3, 20240315), (4, 20240320), (5, 20240325), (6, 20240330);
-- Abril (7 registros)
INSERT INTO Hecho_Registros_Usuario (ID_Usuario_CS, ID_Fecha_Registro_CS) VALUES
(7, 20240401), (8, 20240405), (9, 20240410), (10, 20240415), (11, 20240420), (12, 20240425), (13, 20240430);
-- Mayo (7 registros)
INSERT INTO Hecho_Registros_Usuario (ID_Usuario_CS, ID_Fecha_Registro_CS) VALUES
(14, 20240501), (15, 20240505), (1, 20240510), (2, 20240515), (3, 20240520), (4, 20240525), (5, 20240530);

-- -------------------------------------------------------------------------------------------------------
-- Hecho_Inscripciones (ID_Inscripcion_CS es IDENTITY)
-- ID_Inscripcion_CN se simula como una secuencia
-- -------------------------------------------------------------------------------------------------------
-- Enero (7 registros)
INSERT INTO Hecho_Inscripciones (ID_Inscripcion_CN, ID_Usuario_CS, ID_Curso_CS, ID_Fecha_Inscripcion_CS, Estado_Inscripcion) VALUES
(1001, 1, 1, 20240101, 'Activa'), (1002, 2, 2, 20240105, 'Activa'), (1003, 3, 3, 20240110, 'Completado'),
(1004, 4, 4, 20240115, 'Activa'), (1005, 5, 5, 20240120, 'Cancelada'), (1006, 6, 6, 20240125, 'Activa'),
(1007, 7, 7, 20240130, 'Completado');
-- Febrero (7 registros)
INSERT INTO Hecho_Inscripciones (ID_Inscripcion_CN, ID_Usuario_CS, ID_Curso_CS, ID_Fecha_Inscripcion_CS, Estado_Inscripcion) VALUES
(1008, 8, 8, 20240201, 'Activa'), (1009, 9, 9, 20240205, 'Activa'), (1010, 10, 10, 20240210, 'Activa'),
(1011, 11, 1, 20240215, 'Completado'), (1012, 12, 2, 20240220, 'Activa'), (1013, 13, 3, 20240225, 'Cancelada'),
(1014, 14, 4, 20240228, 'Activa');
-- Marzo (7 registros)
INSERT INTO Hecho_Inscripciones (ID_Inscripcion_CN, ID_Usuario_CS, ID_Curso_CS, ID_Fecha_Inscripcion_CS, Estado_Inscripcion) VALUES
(1015, 15, 5, 20240301, 'Activa'), (1016, 1, 6, 20240305, 'Completado'), (1017, 2, 7, 20240310, 'Activa'),
(1018, 3, 8, 20240315, 'Activa'), (1019, 4, 9, 20240320, 'Activa'), (1020, 5, 10, 20240325, 'Completado'),
(1021, 6, 1, 20240330, 'Cancelada');
-- Abril (7 registros)
INSERT INTO Hecho_Inscripciones (ID_Inscripcion_CN, ID_Usuario_CS, ID_Curso_CS, ID_Fecha_Inscripcion_CS, Estado_Inscripcion) VALUES
(1022, 7, 2, 20240401, 'Activa'), (1023, 8, 3, 20240405, 'Activa'), (1024, 9, 4, 20240410, 'Completado'),
(1025, 10, 5, 20240415, 'Activa'), (1026, 11, 6, 20240420, 'Cancelada'), (1027, 12, 7, 20240425, 'Activa'),
(1028, 13, 8, 20240430, 'Completado');
-- Mayo (7 registros)
INSERT INTO Hecho_Inscripciones (ID_Inscripcion_CN, ID_Usuario_CS, ID_Curso_CS, ID_Fecha_Inscripcion_CS, Estado_Inscripcion) VALUES
(1029, 14, 9, 20240501, 'Activa'), (1030, 15, 10, 20240505, 'Activa'), (1031, 1, 2, 20240510, 'Activa'),
(1032, 2, 3, 20240515, 'Completado'), (1033, 3, 4, 20240520, 'Activa'), (1034, 4, 5, 20240525, 'Cancelada'),
(1035, 5, 6, 20240530, 'Activa');

-- -------------------------------------------------------------------------------------------------------
-- Hecho_Logins (ID_Login_CS es IDENTITY)
-- -------------------------------------------------------------------------------------------------------
-- Enero (7 logins)
INSERT INTO Hecho_Logins (ID_Usuario_CS, ID_Fecha_Login_CS) VALUES
(1, 20240101), (2, 20240105), (3, 20240110), (4, 20240115), (5, 20240120), (6, 20240125), (7, 20240130);
-- Febrero (7 logins)
INSERT INTO Hecho_Logins (ID_Usuario_CS, ID_Fecha_Login_CS) VALUES
(8, 20240201), (9, 20240205), (10, 20240210), (11, 20240215), (12, 20240220), (13, 20240225), (14, 20240228);
-- Marzo (7 logins)
INSERT INTO Hecho_Logins (ID_Usuario_CS, ID_Fecha_Login_CS) VALUES
(15, 20240301), (1, 20240305), (2, 20240310), (3, 20240315), (4, 20240320), (5, 20240325), (6, 20240330);
-- Abril (7 logins)
INSERT INTO Hecho_Logins (ID_Usuario_CS, ID_Fecha_Login_CS) VALUES
(7, 20240401), (8, 20240405), (9, 20240410), (10, 20240415), (11, 20240420), (12, 20240425), (13, 20240430);
-- Mayo (7 logins)
INSERT INTO Hecho_Logins (ID_Usuario_CS, ID_Fecha_Login_CS) VALUES
(14, 20240501), (15, 20240505), (1, 20240510), (2, 20240515), (3, 20240520), (4, 20240525), (5, 20240530);

-- GO
-- Reactivar las restricciones de clave externa si se deshabilitaron
-- EXEC sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all"
-- GO

SELECT 'Inserci�n de datos completada.' AS Mensaje;