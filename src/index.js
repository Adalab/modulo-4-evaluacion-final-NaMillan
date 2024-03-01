const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');


//Crear el servidor
const server = express();
server.use(cors());
require('dotenv').config(); //Para utilizar variables de estado

//Conexion con la base de datos
async function getConnection() {
    const connection= await mysql.createConnection({
  host:proccess.env.HOST,// ip del servidor de my sql al que estoy conectada
  user: proccess.env.USER_DB, //nombre de usuario mysql
  password: process.env.USERPASS, //contraseña en mysql 
  database:'plantShop', // nombre de la base de datos
    });
    await connection.connect();
    return connection;
  }

// init express aplication
const serverPort = 4000;
server.listen(serverPort, () => {
    console.log(`Server listening at http://localhost:${serverPort}`);
  });

  //me falta incluir lo del publish buscar e incluir en el package jason

//endpoints ejemplo

/*server.get  ('/api/movies', async (req,res) => {
  const conex= await getConnection();
  const sql= 'SELECT * FROM movies';
  const [results]= await conex.query(sql);
  console.log (results);
  //conex.end();
  res.json({success:true, movies:results });
});

//crear servidor estatico
const staticServer ="./src/public-react";
server.use(express.static(staticServer));*/


