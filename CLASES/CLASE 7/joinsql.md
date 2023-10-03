
1. **Consulta con INNER JOIN para obtener pacientes y sus provincias:**

    ```sql
    SELECT p.patient_id, CONCAT(p.first_name, ' ', p.last_name) AS nombre_completo, p.city, pn.province_name
    FROM patients p
    INNER JOIN province_names pn ON p.province_id = pn.province_id;
    ```

    *Explicación:* Esta consulta utiliza un INNER JOIN para combinar la información de las tablas `patients` y `province_names` basándose en la columna `province_id`. Devuelve información sobre los pacientes, incluyendo su nombre completo, ciudad y provincia.

2. **Consulta con LEFT JOIN para obtener pacientes y sus doctores (incluso si no tienen doctor asignado):**

    ```sql
    SELECT p.patient_id, CONCAT(p.first_name, ' ', p.last_name) AS nombre_paciente, d.first_name AS nombre_doctor, d.last_name AS apellido_doctor, d.specialty
    FROM patients p
    LEFT JOIN admissions a ON p.patient_id = a.patient_id
    LEFT JOIN doctors d ON a.attending_doctor_id = d.doctor_id;
    ```

    *Explicación:* Aquí utilizamos un LEFT JOIN para incluir todos los pacientes, incluso aquellos que no tienen admisiones o doctores asignados. Esto es útil para obtener información completa de pacientes, independientemente de si han sido atendidos por un doctor.

3. **Consulta con RIGHT JOIN para obtener doctores y sus pacientes (incluso si no han atendido a ningún paciente):**

    ```sql
    SELECT d.doctor_id, CONCAT(d.first_name, ' ', d.last_name) AS nombre_doctor, d.specialty, p.patient_id, CONCAT(p.first_name, ' ', p.last_name) AS nombre_paciente
    FROM  patients p
    RIGHT JOIN admissions a ON  p.patient_id = a.patient_id
    RIGHT JOIN doctors d ON  a.attending_doctor_id= d.doctor_id;
    ```

    *Explicación:* En este caso, usamos un RIGHT JOIN para incluir todos los doctores, incluso aquellos que no han tenido admisiones. Esto es útil para obtener información completa de doctores, independientemente de si han atendido a un paciente.

4. **Consulta con FULL JOIN para obtener todas las admisiones con información de pacientes y doctores:**

    ```sql
    SELECT p.patient_id, CONCAT(p.first_name, ' ', p.last_name) AS nombre_paciente, d.doctor_id, CONCAT(d.first_name, ' ', d.last_name) AS nombre_doctor, a.admission_date, a.discharge_date, a.diagnosis
    FROM patients p
    FULL JOIN admissions a ON p.patient_id = a.patient_id
    FULL JOIN doctors d ON a.attending_doctor_id = d.doctor_id;
    ```

    *Explicación:* Utilizamos un FULL JOIN para obtener todas las admisiones, incluyendo información completa de pacientes y doctores, incluso si no están vinculados entre sí. Esto proporciona una visión completa de todas las admisiones, pacientes y doctores.