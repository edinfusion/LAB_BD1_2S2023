-- CALIFICACION DE FUNCIONALIDADES Y VALIDACIONES
-- REGISTRO DE ESTUDIANTES
CALL registrarEstudiante(202500001,'Estudiante de','Sistemas Calificacion','31-10-2023','sistemascalificacion@gmail.com',12345678,'direccion Sistemas calificacion',42792920101,3); -- OK
CALL registrarEstudiante(202100002,'Estudiante de','Civil Dos','03-08-1998','civildos@gmail.com',12345678,'direccion de estudiante civil 2',3181781580101,1); -- YA EXISTE
CALL registrarEstudiante(202400002,'Estudiante de','Civil con nac malo','1990-20-08','civildos@gmail.com',12345678,'direccion de estudiante civil 2',3181781580101,1); -- FECHA INCORRECTA
CALL registrarEstudiante(202400002,'Estudiante de','carrear inexistente','03-08-1998','civildos@gmail.com',12345678,'direccion de estudiante civil 2',3181781580101,100); -- NO EXISTE CARRERA
-- REGISTRO DE CARRERAS
CALL crearCarrera('Carrera de calificacion');    -- OK
CALL crearCarrera('Ingenieria Sistemas');    -- YA EXISTE
CALL crearCarrera('C@RR3ER@ N0 TI3N3 S010 13ETRAS');    -- CARRERA NO TIENE SOLO LETRAS
-- REGISTRO DE DOCENTES 
CALL registrarDocente('Docente','De Calificacion','20-12-1980','docentecali@ingenieria.usac.edu.gt',12345678,'direcciondocentecalificacion',12345678912,100); -- OK
CALL registrarDocente('Docente3','Apellido3','20-12-1980','docente3@ingenieria.usac.edu.gt',12345678,'direcciondocente3',12345678912,3); -- YA EXISTE
CALL registrarDocente('Docente con','correo incorrect','20-12-1980','docente3ingenieria.usac.edu.gt',12345678,'direcciondocente3',12345678912,20); -- CORREO INVALIDO
-- AGREGAR CURSO
CALL crearCurso(778,'Curso Calificacion',10,4,3,false); -- OK
CALL crearCurso(126,'Curso Industrial ENSEÑAR A DIBUJAR',2,4,2,true); -- YA EXISTE
CALL crearCurso(503802,'curso negativo',-2,4,2,true); -- CURSO CON NUMEROS NEGATIVOS
CALL crearCurso(503802,'curso sin carrera',2,4,1000,true); -- no existe carrera

-- AGREGAR CURSO HABILITADO
CALL habilitarCurso(101,'2S',100,3,'A'); -- OK AREA COMUN
CALL habilitarCurso(778,'2S',1,2,'A'); -- OK AREA PROFESIONAL SISTEMAS
CALL habilitarCurso(778,'2S',1,2,'A'); -- SECCION REPETIDA
CALL habilitarCurso(503802,'2S',1,2,'A'); -- CURSO NO EXISTE
CALL habilitarCurso(101,'2S',100,-3,'B'); -- CUPOMAX NEGATIVO
CALL habilitarCurso(101,'2S',100,3,'2'); -- SECCION NO ES UNA LETRA

-- AGREGAR HORARIO DE CURSO HABILITADO
CALL agregarHorario(1,3,"9:00-10:40"); -- SE PUEDE MODIFICAR PRIMER NUMERO (ID CURSO HABILITADO)
CALL agregarHorario(2,3,"17:00-18:40"); -- SE PUEDE MODIFICAR PRIMER NUMERO (ID CURSO HABILITADO)
CALL agregarHorario(1000,3,"17:00-18:40"); -- id de curso habilidato no existe
CALL agregarHorario(1,100,"17:00-18:40"); -- dia fuera de rango

-- ASIGNAR CURSO ESTUDIANTE
-- codcurso, ciclo, seccion, carnet
CALL asignarCurso(101,'2S','a',202000001); -- AREA COMUN OK
CALL asignarCurso(101,'2S','a',202100001); -- AREA COMUN OK
CALL asignarCurso(101,'2S','a',202200001); -- AREA COMUN OK
            -- AGREGAR A ESTUDIANTES 80 CREDITOS
CALL asignarCurso(778,'2S','a',202000001); -- AREA PROFESIONAL SISTEMAS OK
CALL asignarCurso(778,'2S','a',202000002); -- AREA PROFESIONAL SISTEMAS OK
CALL asignarCurso(778,'2S','a',202100001); -- AREA PROFESIONAL SISTEMAS ESTUDIANTE NO PUEDE LLEVAR CURSO DE OTRA CARRERA
CALL asignarCurso(101,'2S','a',202300001); -- AREA COMUN SE LLEGO AL LIMITE DE ASIGNADOS
CALL asignarCurso(101,'2S','a',202200001); -- AREA COMUN ESTUDIANTE YA ASIGNADO
CALL asignarCurso(101,'2S','a',123456789); -- CARNET NO EXISTE
CALL asignarCurso(101,'2S','Z',202800002); -- SECCION NO EXISTE

-- DESASIGNAR CURSO ESTUDIANTE
CALL desasignarCurso(101,'2S','a',202200001); -- curso desasignado ok
CALL desasignarCurso(101,'2S','a',201709311); -- no existe el estudiante en la seccion

-- INGRESAR NOTA
CALL ingresarNota(101,'2S','a',202000001,-61); -- ERROR EN NOTA
CALL ingresarNota(101,'2S','a',202000001,61);
CALL ingresarNota(101,'2S','a',202100001,60.4);
CALL ingresarNota(101,'3S','a',202100001,60.4); -- ERROR

-- GENERAR ACTA
CALL generarActa(101,'2S','a'); -- OK
CALL generarActa(778,'2S','a'); -- NO SE HA INGRESADO NOTAS


-- CALIFICACION DE PROCESAMIENTO DE DATOS
-- CONSULTA 1
CALL consultarPensum(1);
CALL consultarPensum(2);
CALL consultarPensum(3);
CALL consultarPensum(4);
-- CONSULTA 2
CALL consultarEstudiante(202000001);
CALL consultarEstudiante(202000002);
CALL consultarEstudiante(202100002);
CALL consultarEstudiante(202500001);
-- CONSULTA 3
CALL consultarDocente(1);
CALL consultarDocente(100);
-- CONSULTA 4
CALL consultarAsignados(101, '2S', 2023, 'A');
CALL consultarAsignados(778, '2S', 2023, 'A');
-- CONSULTA 5
CALL consultarAprobacion(101, '2S', 2023, 'A');
CALL consultarAprobacion(778, '2S', 2023, 'A');
-- CONSULTA 6
CALL consultarActas(101);
CALL consultarActas(778);
-- CONSULTA 7
call consultarDesasignacion(101, '2S', 2023, 'A');
call consultarDesasignacion(778, '2S', 2023, 'A');
