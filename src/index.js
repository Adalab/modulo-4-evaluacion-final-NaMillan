const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');
require('dotenv').config();


const server = express();
server.use(cors());
server.use(express.json());

const serverPort = process.env.PORT || 4500;

//Conexion con la base de datos
async function connect_db () {
    const connection= await mysql.createConnection({
  host: process.env.HOST || 'localhost',
  user: process.env.USER_DB || 'root', 
  password: process.env.USERPASS || 'root',
  database: 'plantShop',
    });
    await connection.connect();
    return connection;
  }
 
server.listen(serverPort, () => {
    console.log(`Server listening at http://localhost:${serverPort}`);
  });

//endpoints
//Leer y listar registros existentes
server.get('/plants', async (req,res) => {
  const conex= await connect_db();
  const sql= 'SELECT * FROM plants';
  const [result]= await conex.query(sql);
  console.log (result);
  conex.end();
  res.json({success:true, results:result });
});

 // Insertar la planta en la tabla de favoritos
server.post('/favoritos', async (req, res) => {
  try {
  const { id, plantID } = req.body;
  const conex= await connect_db();
  const sql = 'INSERT INTO favorites (id, plantID) VALUES (?, ?)';
  const [result] = await conex.query(sql, [id, plantID]);
  if (result && result.insertId) {
    console.log('Planta insertada en favoritos correctamente');
    res.status(200).json({ success: true, favoriteID: result.insertId });
} else {
    console.error('Error al insertar planta en favoritos');
    res.status(500).json({ success: false, message: 'Error al insertar planta en favoritos' });
}
}catch (error) {
console.error('Error al insertar planta en favoritos:', error);
res.status(500).json({ success: false, message: 'Error al insertar planta en favoritos' });
}
});








