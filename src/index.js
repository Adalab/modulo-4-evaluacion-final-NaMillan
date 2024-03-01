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
  conex.end;
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

//Leer registro filtrado por id planta
server.get('/plants/:id', async (req,res) => {
  try {
const idPlant = req.params.id;
const conex= await connect_db();

if (isNaN(parseInt(idPlant))){
  return res.json({succes:false, error:'el id debe ser un numero'});
}
const query = 'SELECT * from plants where plantID=?';
const [result] = await conex.query(query,[idPlant]);
conex.end;
if (result.length ===0){
  return res.json({succes:true, message: 'el id no existe'});
}
res.json ({success:true, plant:result[0]});
  }catch (error){
    console.error('Error al obtener la planta por ID:', error);
    res.status(500).json({ success: false, message: 'Error al obtener planta por ID' });  
  } 
});

//Actualizar un registro existente en la tabla usuarios

server.put('/usuarios/:id', async (req,res)=>{
  try {
    const conex= await connect_db();
    const id = req.params.id;
    const data = req.body;
    const { email, nombre, direccion, password} = data;
    
    const sql = 'UPDATE usuarios SET email=?, nombre=?, direccion=?, password=? WHERE id=? ';
    const [result] = await conex.query(sql, [email, nombre, direccion, password,id]);
    conex.end;
    
    res.json ({
    success:true,
    message: 'Usuario actualizado correctamente',
    });
  } catch (error){
    console.log(error);
  }
  });

//Eliminar un favorites
server.delete('/favorites', async (req,res) => {
  const conex= await connect_db();
  const idFavorite=req.query.id;

  const sql= 'DELETE from favorites where favoriteID=?';
  const [result] = await conex.query(sql, [idFavorite]);
  
  if (result.affectedRows > 0){
    res.json({
      succes:true,
      message:'Eliminado correctamente',
    });
  }else {
    res.json({
      succes:false,
      message:'Ocurrio un error, no se elimino el registro',
    });
  }
    });
 

