INSERT INTO Grupo(nombre) VALUES
('Los espumosos'),
('Grupito2');

INSERT INTO Usuario (correo, password, rol, nombre, nacimiento, puntuacion, idGrupo) VALUES
('profesor1@unizar.es', 'profesor1', 1, 'Profesor1', 1977, 0, 1),
('profesor2@unizar.es', 'profesor2', 1, 'Profesor2', 1980, 0, 1),
('alumno1@unizar.es', 'alumno1', 2, 'Alumno1', 1996, 0, 2),
('alumno2@unizar.es', 'alumno2', 2, 'Alumno2', 1997, 0, 3),
('persona1@unizar.es', 'persona1', 3, 'Persona1', 1985, 0, 1),
('persona2@unizar.es', 'persona2', 3, 'Persona2', 1988, 0, 1);

INSERT INTO Entrada (nombreImagen, titulo, fecha, noticia, reto, consejo, estado, idGrupo) VALUES
('img/img1.jpg','La contaminacion ambiental', null,'CUERPO DE LA NOTICIA1', '¿Te atreves a venir andando a la universidad/trabajo durante una semana?',
   'Si guardas los botes de café que uses, puedes usarlos para guardar bolígrafos e incluso decorarlos.',1,2),
('img/img2.jpg','La contaminacion sonora', null,'CUERPO DE LA NOTICIA2', 'Durante una semana no compres alimentos envasados individualmente.',
   'Guarda siempre una bolsa de plástico en la mochila por si la necesitas cuando vayas a comprar.',1,3);

INSERT INTO Cuestionario (tipo, pregunta, numFallos, numAciertos, posCorrecta, idEntrada) VALUES
(0, '¿Que tarda más en desaparecer de la naturaleza?', 1, 1, 1, 1),
(1, '¿Que te ha parecido la noticia 1?', 0, 0, 1, 1),
(0, '¿Que desechos tardan mas?', 1, 1, 2, 2),
(1, '¿Que te ha parecido la noticia 2?', 0, 0, 0, 2);

INSERT INTO Respuesta (posicion, cuerpo, tipoCuestionario, idEntrada) VALUES
(1,'Esta es la respuesta 1 (correcta)', 0, 1),
(2,'Esta es la respuesta 2 (incorrecta)', 0, 1),
(1,'Bien', 1, 1),
(2,'Mal', 1, 1),
(1,'Esta es la respuesta 1 (incorrecta)', 0, 2),
(2,'Esta es la respuesta 2 (correcta)', 0, 2),
(1,'Genial', 1, 2),
(2,'No tan bien', 1, 2);

INSERT INTO contestar (idEntrada, tipo, correo, posPregunta) VALUES
(1,0,'persona1@unizar.es',1),
(1,0,'persona2@unizar.es',2),
(2,0,'persona1@unizar.es',1),
(2,0,'persona1@unizar.es',2);
