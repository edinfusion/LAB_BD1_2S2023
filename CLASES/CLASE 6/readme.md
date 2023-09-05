
## ESTRUCTURA BÁSICA DE API
#### Estructura de Carpetas 
- src
    - controllers
        - Aquí se encuentran los archivos controladores que manejan las solicitudes HTTP.
    - db
        - Este directorio alberga los archivos relacionados con la base de datos.
            - `conexion.js`: Archivo de conexión a la base de datos.
            - `config.js`: Archivo de configuración de la base de datos.
    - routes
        - En esta carpeta se encuentran los archivos de rutas de la API.
- app.js
        - El archivo principal de la aplicación que configura y ejecuta el servidor.
- index.js
        - Este archivo inicia la aplicación y escucha las solicitudes HTTP.

#### Descripción de Carpetas y Archivos
- controllers: Aquí se guardan los archivos controladores que gestionan la lógica de la API. Cada controlador debería manejar un conjunto específico de rutas o recursos.

- db: Este directorio contiene archivos relacionados con la base de datos. conexion.js se encarga de establecer la conexión con la base de datos, y config.js almacena la configuración de la base de datos, como la URL y las credenciales de acceso.

- routes: En esta carpeta, se definen las rutas de la API. Cada archivo de ruta debería especificar las rutas y los controladores asociados a ellas.

- app.js: Este archivo es el punto de entrada principal de la aplicación. Aquí se configuran los middleware, se establece el servidor HTTP y se importan las rutas.

- index.js: Este archivo es responsable de iniciar la aplicación y hacerla escuchar en un puerto específico. Es elarchivo global de la API
  
- .env: este archivo contiene las variables de entorno de la aplicación, como la URL de la base de datos y el puerto en el que se ejecuta la aplicación.

## INICIAR SERVIDOR CON NODEJS
#### PASOS
1. npm init -y
2. npm install express
3. npm install nodemon -D
4. npm install dotenv
5. npm install mysql2
6. npm install cors
7. crear achivo .gitignore
   
