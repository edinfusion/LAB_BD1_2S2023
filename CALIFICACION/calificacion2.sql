-- reset auto incrementable
-- ALTER TABLE proyecto2.carrera AUTO_INCREMENT = 0;


-- CALIFICACION DE FUNCIONALIDADES Y VALIDACIONES
-- REGISTRO DE ESTUDIANTES
EXEC registrarEstudiante 202500001,'Estudiante de','Sistemas Calificacion','31-10-2023','sistemascalificacion@gmail.com',12345678,'direccion Sistemas calificacion',42792920101,3; -- OK
EXEC registrarEstudiante 202100002,'Estudiante de','Civil Dos','03-08-1998','civildos@gmail.com',12345678,'direccion de estudiante civil 2',3181781580101,1; -- YA EXISTE
EXEC registrarEstudiante 202400002,'Estudiante de','Civil con nac malo','1990-20-08','civildos@gmail.com',12345678,'direccion de estudiante civil 2',3181781580101,1; -- FECHA INCORRECTA
EXEC registrarEstudiante 202400002,'Estudiante de','carrear inexistente','03-08-1998','civildos@gmail.com',12345678,'direccion de estudiante civil 2',3181781580101,100; -- NO EXISTE CARRERA
-- REGISTRO DE CARRERAS
EXEC crearCarrera 'Carrera de calificacion';    -- OK
EXEC crearCarrera 'Ingenieria Sistemas';    -- YA EXISTE
EXEC crearCarrera 'C@RR3ER@ N0 TI3N3 S010 13ETRAS';    -- CARRERA NO TIENE SOLO LETRAS
-- REGISTRO DE DOCENTES 
EXEC registrarDocente 'Docente','De Calificacion','20-12-1980','docentecali@ingenieria.usac.edu.gt',12345678,'direcciondocentecalificacion',12345678912,100; -- OK
EXEC registrarDocente 'Docente3','Apellido3','20-12-1980','docente3@ingenieria.usac.edu.gt',12345678,'direcciondocente3',12345678912,3; -- YA EXISTE
EXEC registrarDocente 'Docente con','correo incorrect','20-12-1980','docente3ingenieria.usac.edu.gt',12345678,'direcciondocente3',12345678912,20; -- CORREO INVALIDO
-- AGREGAR CURSO
EXEC crearCurso 777,'Curso Calificacion',10,4,3,false; -- OK
EXEC crearCurso 126,'Curso Industrial ENSEÑAR A DIBUJAR',2,4,2,true; -- YA EXISTE
EXEC crearCurso 503802,'curso negativo',-2,4,2,true; -- CURSO CON NUMEROS NEGATIVOS
EXEC crearCurso 503802,'curso sin carrera',2,4,1000,true; -- no existe carrera

-- AGREGAR CURSO HABILITADO
EXEC habilitarCurso 101,'2S',100,3,'A'; -- OK AREA COMUN
EXEC habilitarCurso 777,'2S',1,2,'A'; -- OK AREA PROFESIONAL SISTEMAS
EXEC habilitarCurso 777,'2S',1,2,'A'; -- SECCION REPETIDA
EXEC habilitarCurso 503802,'2S',1,2,'A'; -- CURSO NO EXISTE
EXEC habilitarCurso 101,'2S',100,-3,'B'; -- CUPOMAX NEGATIVO
EXEC habilitarCurso 101,'2S',100,3,'2'; -- SECCION NO ES UNA LETRA

-- AGREGAR HORARIO DE CURSO HABILITADO
EXEC agregarHorario 1,3,"9:00-10:40"; -- SE PUEDE MODIFICAR PRIMER NUMERO  ID CURSO HABILITADO
EXEC agregarHorario 2,3,"17:00-18:40"; -- SE PUEDE MODIFICAR PRIMER NUMERO  ID CURSO HABILITADO
EXEC agregarHorario 1000,3,"17:00-18:40"; -- id de curso habilidato no existe
EXEC agregarHorario 1,100,"17:00-18:40"; -- dia fuera de rango

-- ASIGNAR CURSO ESTUDIANTE
-- codcurso, ciclo, seccion, carnet
EXEC asignarCursoEstudiante 101,'2S','a',202000001; -- AREA COMUN OK
EXEC asignarCursoEstudiante 101,'2S','a',202100001; -- AREA COMUN OK
EXEC asignarCursoEstudiante 101,'2S','a',202200001; -- AREA COMUN OK
            -- AGREGAR A ESTUDIANTES 80 CREDITOS
EXEC asignarCursoEstudiante 777,'2S','a',202000001; -- AREA PROFESIONAL SISTEMAS OK
EXEC asignarCursoEstudiante 777,'2S','a',202000002; -- AREA PROFESIONAL SISTEMAS OK
EXEC asignarCursoEstudiante 777,'2S','a',202100001; -- AREA PROFESIONAL SISTEMAS ESTUDIANTE NO PUEDE LLEVAR CURSO DE OTRA CARRERA
EXEC asignarCursoEstudiante 101,'2S','a',202300001; -- AREA COMUN SE LLEGO AL LIMITE DE ASIGNADOS
EXEC asignarCursoEstudiante 101,'2S','a',202200001; -- AREA COMUN ESTUDIANTE YA ASIGNADO
EXEC asignarCursoEstudiante 101,'2S','a',123456789; -- CARNET NO EXISTE
EXEC asignarCursoEstudiante 101,'2S','Z',202800002; -- SECCION NO EXISTE

-- DESASIGNAR CURSO ESTUDIANTE
EXEC desasignarCursoEstudiante 101,'2S','a',202200001; -- curso desasignado ok
EXEC desasignarCursoEstudiante 101,'2S','a',201709311; -- no existe el estudiante en la seccion

-- INGRESAR NOTA
EXEC ingresarNotas 101,'2S','a',202000001,-61; -- ERROR EN NOTA
EXEC ingresarNotas 101,'2S','a',202000001,61;
EXEC ingresarNotas 101,'2S','a',202100001,60.4;
EXEC ingresarNotas 101,'3S','a',202100001,60.4; -- ERROR

-- GENERAR ACTA
EXEC generarActa 101,'2S','a'; -- OK
EXEC generarActa 777,'2S','a'; -- NO SE HA INGRESADO NOTAS


-- CALIFICACION DE PROCESAMIENTO DE DATOS
-- CONSULTA 1
EXEC consultarPensum 1;
EXEC consultarPensum 2;
EXEC consultarPensum 3;
EXEC consultarPensum 4;
-- CONSULTA 2
EXEC consultarEstudiante 202000001;
EXEC consultarEstudiante 202000002;
EXEC consultarEstudiante 202100002;
EXEC consultarEstudiante 202500001;
-- CONSULTA 3
EXEC consultarDocente 1;
EXEC consultarDocente 100;
-- CONSULTA 4
EXEC consultarEstudiantesAsignados 101, '2S', 2023, 'A';
EXEC consultarEstudiantesAsignados 777, '2S', 2023, 'A';
-- CONSULTA 5
EXEC consultarAprobacion 101, '2S', 2023, 'A';
EXEC consultarAprobacion 777, '2S', 2023, 'A';
-- CONSULTA 6
EXEC consultarActas 101;
EXEC consultarActas 777;
-- CONSULTA 7
EXEC consultarDesasignacion 101, '2S', 2023, 'A';
EXEC consultarDesasignacion 777, '2S', 2023, 'A';







