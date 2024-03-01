![Adalab](https://beta.adalab.es/resources/images/adalab-logo-155x61-bg-white.png)

# Módulo 4: Ejercicio de evaluación final

## Enunciado

El ejercicio consiste en desarrollar un API que permita insertar, modificar, listar y eliminar información utilizando Express.js, Node.js y la bases de datos MySQL (mi elección).

### Hitos del ejercicio:
1. **Diseño de la Base de Datos**
He diseñado una base de datos en MySql para una tienda de plantas, en la cual el usuario puede ver las distintas plantas ofertadas y su respectiva descripcion y cuidados, adicionalmente podria agregar plantas a favoritos y consultar sus dudas con un experto, para lo cual cree las siguientes tablas: 

 - Usuarios (con los nombres de los registros segun lo solicitado en el ejercicio)
 - Plants
 - Favorites
 - Contact Professionals
2. **Configuración del Servidor**
Escribi el código para configurar el servidor Express.js y conectarse a la base de datos.
Implemente las funciones necesarias para el manejo de JSON y las funcionalidades necesarias.
los datos para la conexion en la base de datos se encuentran guardados en variables de entorno.

3. **API RESTful**
Defini las rutas para las siguientes operaciones con los endpoints correspondientes:
- Insertar un registro en su entidad principal. (Insertar la planta en la tabla de favoritos)
  /favoritos
- Leer/Listar todos los registros existentes.
  /plants
- Leer registros filtrado por el campo de tu interés.(Leer registro filtrado por id planta)
  /plants/:id
- Actualizar un registro existente.(Actualizar un registro existente en la tabla usuarios)
  /usuarios/:id
- Eliminar un registro existente. (Eliminar un favorito)
  /favorites
3. **BONUS**
La API esta definida pensando en incluir endpoint relacionados con la tabla de contacto con profesionales, asi como la autenticacion de los usuarios para ver sus favoritos, por lo que estan son funcionalidades que se agregaran luego de la revisión.


### Entrega

El límite de entrega es el Viernes 01 de Marzo a las 14:00

